@WI.module "DocumentApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Layout extends App.Views.Layout
    template: "document/new/new_layout"

    regions:
      titleRegion:      "#title-region"
      editorRegion:     "#editor-region"

  class New.Title extends App.Views.ItemView
    template: "document/new/_title"

  class New.Editor extends App.Views.ItemView
    template: "document/new/_editor"

    onRender: ->
      @addHashtags()

    addHashtags: ->
      @$el.find('.edit-document').tweetLinks()

    events:
      "keyup" : 'saveFunction'

    # getLastWord: ->
    #   text = @$el.find('.edit-document').text()
    #   lastWord = text.match(/[A-Za-z0-9-_]+\ ?$/)

    getLastWord: -> _.last( _.str.words(@$el.find('.edit-document').text()))

      # _.last( _.words(@$el.find('.edit-document').text()))

    # replaceHash: ->
    #   lastWord = @getLastWord()
    #   if lastWord[0] is '#'


    saveFunction: (e) =>
      model = @.model
      if (e.keyCode ==32 || e.keyCode ==190 )
        @trigger "document:save", (model)
        console.log @getLastWord()
        # @addHashtags()
      if (e.keyCode ==37 || e.keyCode ==39)
        console.log "arrow"
