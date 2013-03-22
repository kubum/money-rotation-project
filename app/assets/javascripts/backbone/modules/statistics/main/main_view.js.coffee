@Page.module "StatisticsApp.Main", (Main, App, Backbone, Marionette, $, _) ->
	
	class Main.Show extends App.Views.ItemView
		template: "statistics/main/templates/show"