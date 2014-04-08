@WI.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Header extends Entities.Model

  class Entities.HeaderCollection extends Entities.Collection
    model: Entities.Header

  API =
    getHeaders: (currentUserName) ->
      new Entities.HeaderCollection [
        # { name: "Favorites" ,  url: "#favorites", icon:'glyphicon glyphicon-heart' }
        # { name: "About",       url: "#about", icon: '' }
        { name:  currentUserName || ""  }
      ]

  App.reqres.setHandler "header:entities", (currentUserName) ->
    API.getHeaders(currentUserName)
