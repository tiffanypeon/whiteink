@WI.module "DocumentApp", (DocumentApp, App, Backbone, Marionette, $, _) ->


  class DocumentApp.Router extends Marionette.AppRouter
    appRoutes:
      "new": "newDocument"


  API =
    newDocument: ->
      new DocumentApp.New.Controller



  App.addInitializer ->
    new DocumentApp.Router
      controller: API
