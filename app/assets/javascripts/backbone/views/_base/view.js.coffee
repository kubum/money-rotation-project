@Page.module "Views", (Views, App, Backbone, Marionette, $, _) ->
	
	_.extend Marionette.View::,
	
		templateHelpers: ->
			
      # currentUser:
      #   App.request("get:current:user").toJSON()
			
			buttonTo: (name, url, options = {}) ->
				_.defaults options,
					external: false
				
				url = "#" + url unless options.external
				
				"#{@escape(name)}"