@WI.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listHeader: ->
      # currentUser = App.request "get:current:user"
      # currentUserName = currentUser.get("name")
      links = App.request "header:entities"

      headerView = @getHeaderView links
      App.headerRegion.show headerView


    getHeaderView: (links) ->
      new List.Headers
        collection: links
