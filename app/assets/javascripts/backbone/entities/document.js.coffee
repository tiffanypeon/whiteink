@WI.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.Document extends App.Entities.Model
    urlRoot: -> Routes.documents_path()



  class Entities.DocumentCollection extends App.Entities.Collection
    model: Entities.Document

    url: -> Routes.documents_path()


  API =
    getDocuments: ->
      documents = new Entities.DocumentCollection
      documents.fetch
        reset: true
      documents

    getDocument: (id) ->
      document = new Entities.Document
        id: id
      document.fetch()
      document

    newDocument: ->
      new Entities.Document


  App.reqres.setHandler "new:document:entity", ->
    API.newDocument()
