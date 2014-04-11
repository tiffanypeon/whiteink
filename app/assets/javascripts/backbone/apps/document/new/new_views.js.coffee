@WI.module "DocumentApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Layout extends App.Views.Layout
    template: "document/new/new_layout"

    regions:
      # titleRegion:      "#title-region"
      editorRegion:     "#editor-region"
      noteRegion:       "#note-region"
      newIterationRegion: "#newIteration-region"


  class New.NewIteration extends App.Views.ItemView
    template: "document/new/_newiteration"

    triggers:
      "click #newIteration" : "start:new:iteration"

  # class New.Title extends App.Views.ItemView
  #   template: "document/new/_title"

  class New.Editor extends App.Views.ItemView
    template: "document/new/_editor"

    onRender: ->
      @setpopline()


    setpopline:->
      document.execCommand('defaultParagraphSeparator', false, 'p')
      @$el.find(".editor").popline()


    events:
      "keydown" : 'strokeDetector'

    strokeDetector: (e) =>
      model = @.model
      if (e.keyCode ==32 || e.keyCode ==190 )
        @trigger "document:save", (model)
      if (e.keyCode ==37 || e.keyCode ==39)
        false
