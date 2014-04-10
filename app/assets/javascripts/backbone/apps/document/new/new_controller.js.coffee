@WI.module "DocumentApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: ->
      draft = App.request "draft:last:entity"
      draft or= App.request "new:draft:entity"

      App.execute "when:fetched", draft, =>

        @layout = @getLayoutView(draft)

        @listenTo @layout, "show", =>
          @noteRegion(draft)
          @editorRegion(draft)

        App.mainRegion.show @layout, loading: true


    noteRegion: (draft)->
      App.vent.trigger "note:list", @layout.noteRegion, draft
      # titleView = @getTitleView()
      # @show titleView, region: @layout.titleRegion


    editorRegion: (draft) ->
      editorView = @getEditorView(draft)



      @listenTo editorView, "document:save", (draft) =>
        # console.log draft
        text = $(".edit-document").text()
        draft.set({content: text})
        draft.save()


      @show editorView, region: @layout.editorRegion

    getTitleView: ->
      new New.Title


    getEditorView: (draft) ->
      new New.Editor
        model: draft


    getLayoutView: (draft) ->
      new New.Layout
        model: draft
