@WI.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	
	class Show.Footer extends Marionette.ItemView
		template: "footer/show/show_footer"
		
		# modelEvents:
		# 	"change" : "render"