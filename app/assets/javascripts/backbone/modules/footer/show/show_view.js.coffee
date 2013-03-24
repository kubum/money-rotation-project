@Page.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	
	class Show.Footer extends App.Views.ItemView
		template: JST["backbone/modules/footer/show/templates/show_footer"]
		
		# modelEvents:
		# 	"change" : "render"