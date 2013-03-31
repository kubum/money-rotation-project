@Page.module "AccountApp.Main", (Main, App, Backbone, Marionette, $, _) ->
	
	class Main.Show extends App.Views.ItemView
		template: JST["backbone/modules/account/main/templates/show"]