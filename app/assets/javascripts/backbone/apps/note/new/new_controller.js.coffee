@WI.module "NoteApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: (options )->
      {notes} = options
      draft_id = notes.draft_id
      note = App.request "new:note:entity", draft_id


      newView = @getNewView note, notes

      @listenTo newView, "note:save", (note, collection) =>
        window.col = collection
        text = $("#note-input").val()
        note.set({content: text})
        collection.add(note)
        note.save()
        @region.close()

      @listenTo newView, "form:cancel", =>
        @region.close()

      @show newView

    getNewView: (note, notes) ->
      new New.Note
        model: note
        collection: notes
