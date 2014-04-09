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

    getLastDraft: ->
      draft = new Entities.Draft
      draft.fetch()
      draft


    getDraft: (id)->
      draft = new Entities.Draft
        id: id
      draft.fetch()
      draft

    newDraft: ->
      new Entities.Draft

  App.reqres.setHandler "draft:entities", ->
    API.getDraft()

  App.reqres.setHandler "draft:entity",(id) ->
    API.getDraft(id)

  App.reqres.setHandler "draft:last:entity", ->
    API.getLastDraft()

  App.reqres.setHandler "new:draft:entity", ->
    API.newDraft()
