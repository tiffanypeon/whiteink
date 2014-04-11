@WI.module "DocumentApp", (DocumentApp, App, Backbone, Marionette, $, _) ->


  class DocumentApp.Router extends Marionette.AppRouter
    appRoutes:
      "new": "newDocument"
      "edit": "editDocument"


  API =
    newDocument: ->
      new DocumentApp.New.Controller

    editDocument: ->
      new DocumentApp.Edit.Controller

    reviewDraft: (region)->
      new DocumentApp.Review.Controller
        region: region


  App.vent.on "set:review:draft", (region) ->
    API.reviewDraft(region)




  App.addInitializer ->
    new DocumentApp.Router
      controller: API
