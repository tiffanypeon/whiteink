@WI.module "NoteApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options)->
      {draft} = options
      draft_id = draft.id
      notes = App.request "note:entities", draft_id


      App.execute "when:fetched", notes, =>

        @layout = @getLayoutView notes

        @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @panelRegion(notes)
          @notesRegion(notes)
          # @ticketsRegion tickets

        @show @layout, loading: true


    panelRegion: (notes)->
      panelView = @getPanelView(notes)

      @listenTo panelView, "new:note:button:clicked", =>
        @newRegion(notes)

      @show panelView, region: @layout.panelRegion
      # App.execute "list:categories", @layout.addToCatRegion

    newRegion:(notes) ->
      App.execute "new:note:create", notes, @layout.newRegion
      # App.vent.trigger "new:note:create", notes, @layout.newRegion



    notesRegion: (notes) ->
      notesView = @getNotesView notes
      # @layout.conferenceRegion.show conferenceView
      @show notesView, region: @layout.notesRegion


    getNotesView: (notes) ->
      new List.Notes
        collection: notes

    getPanelView: (notes)->
      new List.Panel
        collection: notes


    getLayoutView: (notes) ->
      new List.Layout
        collection: notes
