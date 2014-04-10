@WI.module "NoteApp", (NoteApp, App, Backbone, Marionette, $, _) ->


  # class NoteApp.Router extends Marionette.AppRouter
  #   appRoutes:
  #


  API =
    listNotes: (region, draft) ->
      new NoteApp.List.Controller
        region: region
        draft: draft


  App.vent.on "note:list", (region, draft) ->
    API.listNotes region, draft

  #
  # App.addInitializer ->
  #   new NoteApp.Router
  #     controller: API
