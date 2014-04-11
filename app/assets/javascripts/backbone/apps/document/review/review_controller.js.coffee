@WI.module "DocumentApp.Review", (Review, App, Backbone, Marionette, $, _) ->

  class Review.Controller extends App.Controllers.Application

    initialize: ->
      draft = App.request "draft:review:entity"

      App.execute "when:fetched", draft, =>

        @layout = @getLayoutView(draft)

        @listenTo @layout, "show", =>
          @documentRegion(draft)
        #   @newIterationRegion()
        #   # @noteRegion(draft)
        #   @noteRegion(draft) unless draft.isNew()
        #   @editorRegion(draft)

        @show @layout, loading: true


    documentRegion: (draft) ->
      documentView = @getDocumentView(draft)
      # @listenTo editorView, "document:save", (draft) =>
      #   text = $(".edit-document").html()

      @show documentView, region: @layout.documentRegion

    getDocumentView: (draft) ->
      new Review.Document
        model: draft


    getLayoutView: (draft) ->
      new Review.Layout
        model: draft
