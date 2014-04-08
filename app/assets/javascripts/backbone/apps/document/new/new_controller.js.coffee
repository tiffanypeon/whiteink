@WI.module "DocumentApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: ->
      draft = App.request "new:doraft:entity"

      @layout = @getLayoutView(draft)

      @listenTo @layout, "show", =>
        @titleRegion()
        @editorRegion(draft)

      App.mainRegion.show @layout, loading: true


    titleRegion: ->
      titleView = @getTitleView()
      @show titleView, region: @layout.titleRegion


    editorRegion: (document) ->
      editorView = @getEditorView(draft)
      @show editorView, region: @layout.editorRegion

    getTitleView: ->
      new New.Title


    getEditorView: (draft) ->
      new New.Editor
        model: draft

    getLayoutView: (draft) ->
      new New.Layout
        model: draft
