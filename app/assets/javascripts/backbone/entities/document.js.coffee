@WI.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.Note extends App.Entities.Model

    initialize: (@draft_id, @note_id) ->
    url: -> "/drafts/#{@draft_id}/notes/#{@note_id or ""}"


  class Entities.NoteCollection  extends App.Entities.Collection

    model: Entities.Note
    initialize: (@draft_id) ->

    url: -> "/drafts/#{@draft_id}/notes"




  class Entities.Draft extends App.Entities.Model
    urlRoot: -> Routes.drafts_path()

    relations : [
        type: Backbone.Many,
        key : 'notes',
        relatedModel : Entities.Note
        ]



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

    getNotes: (draft_id) ->
      notes = new Entities.NoteCollection(draft_id)
      notes.fetch
        reset: true
      notes

    newNote:(draft_id) ->
      new Entities.Note(draft_id)

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

  App.reqres.setHandler "note:entities", (draft_id) ->
    API.getNotes(draft_id)

  App.reqres.setHandler "new:note:entity", (draft_id)->
    API.newNote(draft_id)
