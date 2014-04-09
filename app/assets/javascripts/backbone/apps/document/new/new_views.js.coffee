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

    events:
      "keyup" : 'saveFunction'

    saveFunction: (e) =>
      model = @.model
      if (e.keyCode ==32 || e.keyCode ==190 )
        @trigger "document:save", (model)
      if (e.keyCode ==37 || e.keyCode ==39)
        console.log "arrow"
