@WI.module "NoteApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Note extends App.Views.ItemView
    template: "note/new/new_note"

    events:
      "keyup #note-input" : "keyPressEventHandler"

    keyPressEventHandler: (e) =>
      if (e.keyCode ==13)
        model = @.model
        collection = @.collection
        @trigger "note:save", model, collection
