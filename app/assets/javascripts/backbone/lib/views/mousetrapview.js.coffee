_delegate = Backbone.Marionette.View::delegateEvents
_close = Backbone.Marionette.View::close

_.extend Backbone.Marionette.View::,
    delegateEvents: (events) ->
        _delegate.call(@, events)
        @bindShortCuts()
  
    bindShortCuts: ->
        for key, method of _.result(@, "shortCuts")
            method = @[method] unless _.isFunction(method)
            throw new Error("Method #{method} not found!") unless method
            method = _.bind(method, @)
            Mousetrap.bind(key, method)

    close: ->
        _close.call(@)
        @afterClose()

    afterClose: ->
        @unbindShortCuts()

    unbindShortCuts: ->
        for key of _.result(@, "shortCuts")
            Mousetrap.unbind(key)
