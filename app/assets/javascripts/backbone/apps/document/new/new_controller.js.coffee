@WI.module "DocumentApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: ->
      draft = App.request "draft:last:entity"
      draft or= App.request "new:draft:entity"

      App.execute "when:fetched", draft, =>

        @layout = @getLayoutView(draft)

        @listenTo @layout, "show", =>
          @newIterationRegion()
          # @noteRegion(draft)
          @noteRegion(draft) unless draft.isNew()
          @editorRegion(draft)

        App.mainRegion.show @layout, loading: true


    newIterationRegion: ->
      newIterationView = @getNewIterationView()

      @listenTo newIterationView, "start:new:iteration", ->
        draft = App.request "new:draft:entity"
        @editorRegion(draft)

      @show newIterationView, region: @layout.newIterationRegion


    noteRegion: (draft)->
      App.vent.trigger "note:list", @layout.noteRegion, draft


    editorRegion: (draft) ->
      editorView = @getEditorView(draft)

      @listenTo editorView, "document:save", (draft) =>
        text = $(".edit-document").html()
        draft.set({content: text})
        draft.save()


      @show editorView, region: @layout.editorRegion

    getNewIterationView: ->
      new New.NewIteration

    getTitleView: ->
      new New.Title


    getEditorView: (draft) ->
      new New.Editor
        model: draft


    getLayoutView: (draft) ->
      new New.Layout
        model: draft
