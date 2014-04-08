@WI.module "DocumentApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Application

    initialize: ->
      # document = App.request "document:entity"

      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @titleRegion()
        @editorRegion()

      App.mainRegion.show @layout, loading: true


    titleRegion: ->
      titleView = @getTitleView()
      @show titleView, region: @layout.titleRegion


    editorRegion: ->
      editorView = @getEditorView()
      @show editorView, region: @layout.editorRegion

    getTitleView: ->
      new New.Title


    getEditorView: ->
      new New.Editor

    getLayoutView: ->
      new New.Layout
