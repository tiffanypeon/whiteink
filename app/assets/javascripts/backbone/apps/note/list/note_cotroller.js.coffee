@WI.module "NoteApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options)->
      {draft} = options
      draft_id = draft.id
      notes = App.request "note:entities", draft_id

      @layout = @getLayoutView notes

      @listenTo @layout, "close", @close

      @listenTo @layout, "show", =>
        @panelRegion()
        @notesRegion(notes)
        # @ticketsRegion tickets

      @show @layout, loading: true


    panelRegion: ->
      panelView = @getPanelView()
      @show panelView, region: @layout.panelRegion
      # App.execute "list:categories", @layout.addToCatRegion

    # notesRegion: ->
      # App.execute "list:user:categories", @layout.userCategoriesRegion


    notesRegion: (notes) ->
      notesView = @getNotesView notes
      # @layout.conferenceRegion.show conferenceView
      @show notesView, region: @layout.notesRegion


    getNotesView: (notes) ->
      new List.Notes
        collection: notes

    getPanelView: ->
      new List.Panel


    getLayoutView: (notes) ->
      new List.Layout
        collection: notes
