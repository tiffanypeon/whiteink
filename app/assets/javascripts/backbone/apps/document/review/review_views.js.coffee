@WI.module "DocumentApp.Review", (Review, App, Backbone, Marionette, $, _) ->

  class Review.Layout extends App.Views.Layout
    template: "document/review/review_layout"

    regions:
      documentRegion:     "#document-region"

  class Review.Document extends App.Views.ItemView
    template: "document/review/_document"
