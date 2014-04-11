@WI.module "DocumentApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Layout extends App.Views.Layout
    template: "document/new/new_layout"
    
    regions:
      # titleRegion:      "#title-region"
      editorRegion:     "#editor-region"
      noteRegion:       "#note-region"

    #shortCuts:
     #   "command+ctrl+c" : -> @trigger "new:note:create"

  # class New.Title extends App.Views.ItemView
  #   template: "document/new/_title"

  class New.Editor extends App.Views.ItemView
    template: "document/new/_editor"

    onRender: ->
      @setpopline()
      
    onShow: ->
      @setFocus()
      
    placeCaretAtEnd = (el) ->
      el.focus()
      if typeof window.getSelection isnt "undefined" and typeof document.createRange isnt "undefined"
        range = document.createRange()
        range.selectNodeContents el
        range.collapse false
        sel = window.getSelection()
        sel.removeAllRanges()
        sel.addRange range
      else unless typeof document.body.createTextRange is "undefined"
        textRange = document.body.createTextRange()
        textRange.moveToElementText el
        textRange.collapse false
        textRange.select()
      return

    setFocus: =>
      console.log "setting focus"
      placeCaretAtEnd document.getElementsByClassName("edit-document")[0]


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
        console.log "left / right arrow"
        false








