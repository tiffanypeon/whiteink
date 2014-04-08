@WI.module "DocumentApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: ->
      document = App.request "new:document:entity"

      @layout = @getLayoutView(document)

      @listenTo @layout, "show", =>
        @titleRegion()
        @editorRegion(document)

      App.mainRegion.show @layout, loading: true


    titleRegion: ->
      titleView = @getTitleView()
      @show titleView, region: @layout.titleRegion


    editorRegion: (document) ->
      editorView = @getEditorView(document)
      @show editorView, region: @layout.editorRegion

    getTitleView: ->
      new New.Title


    getEditorView: (document) ->
      new New.Editor
        model: document

    getLayoutView: (document) ->
      new New.Layout
        model: document
