@Page = do (Backbone, Marionette) ->
  
  App = new Marionette.Application
    
  App.rootRoute  = 'records'
  
  App.on "initialize:before", (options) ->
    if options.currentUser
      @currentUser = App.request "set:current:user", options.currentUser
    else
      @currentUser = null
    
  App.reqres.addHandler "get:current:user", ->
    App.currentUser
		
  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"
  
  # App.addInitializer ->
  #
  
  App.on "initialize:after", (options) ->    
    if Backbone.history
      Backbone.history.start()
            
      @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

    App.module("HeaderApp").start()
    App.module("FooterApp").start()

  App

# Default jQuery code
$(document).ready ->
  $.ajaxSetup statusCode:
    401: ->
      # Redirect the to the login page. (Unauthorized Explained)
      window.location.replace "/#login"

    403: ->
      # 403 -- Access denied
      window.location.replace "/#denied"
