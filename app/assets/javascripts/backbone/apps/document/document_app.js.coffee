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



  App.addInitializer ->
    new DocumentApp.Router
      controller: API
