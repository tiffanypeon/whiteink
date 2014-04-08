@WI.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.Draft extends App.Entities.Model
    urlRoot: -> Routes.drafts_path()



  class Entities.DraftCollection extends App.Entities.Collection
    model: Entities.Draft

    url: -> Routes.drafts_path()


  API =
    getDrafts: ->
      draft = new Entities.DraftCollection
      draft.fetch
        reset: true
      draft

    getDraft: (id) ->
      draft = new Entities.Draft
        id: id
      draft.fetch()
      draft

    newDraft: ->
      new Entities.Draft


  App.reqres.setHandler "new:doraft:entity", ->
    API.newDraft()
