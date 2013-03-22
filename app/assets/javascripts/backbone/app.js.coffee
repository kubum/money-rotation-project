@Page = do (Backbone, Marionette) ->
  
  App = new Marionette.Application
    
  App.rootRoute = '/records'
  
  # App.on "initialize:before", (options) ->
  #   @currentUser = App.request "set:current:user", options.currentUser
  #   
  # App.reqres.addHandler "get:current:user", ->
  #   App.currentUser
		
  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"
  
  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("FooterApp").start()
  
  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""
    
    # if App.currentUser
    #   App.vent.trigger "authentication:logged_in"
    # else
    #   App.vent.trigger "authentication:logged_out"
  
  # App.vent.on "authentication:logged_in", ->
  #   App.mainRegion.show(App.layouts.main)
  # 
  # App.vent.on "authentication:logged_out", ->
  #   App.mainRegion.show(App.layouts.unauthenticated)
  #   
  App