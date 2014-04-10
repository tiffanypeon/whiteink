@WI.module "NoteApp", (NoteApp, App, Backbone, Marionette, $, _) ->


  # class NoteApp.Router extends Marionette.AppRouter
  #   appRoutes:
  #


  API =
    listNotes: (region, draft) ->
      new NoteApp.List.Controller
        region: region
        draft: draft

    newNote: (notes, region) ->
      new NoteApp.New.Controller
        region: region
        notes: notes


  App.vent.on "note:list", (region, draft) ->
    API.listNotes region, draft

  App.commands.setHandler "new:note:create", ( notes, region) ->
    API.newNote notes, region

  #
  # App.addInitializer ->
  #   new NoteApp.Router
  #     controller: API
