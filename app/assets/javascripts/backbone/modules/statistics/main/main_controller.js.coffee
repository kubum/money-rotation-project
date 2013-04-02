@Page.module "StatisticsApp.Main", (Main, App, Backbone, Marionette, $, _) ->
  
  Main.Controller =
    
    week: ->      
      @show "week"
        
    month: ->      
      @show "month"
    
    all: ->      
      @show "all"
    
    show: (type) ->
      @layout = @getLayoutView()
              
      App.request "record:statistics", (records) => 
        @layout.on "show", =>
          @showFilter type
          @showGraph type, records
          
        App.mainRegion.show @layout
          
    showFilter: (type) ->
      @layout.filterRegion.show @getFilter(type)
    
    showGraph: (type, records) ->
      graphView = @getGraphView type, records
      @layout.graphRegion.show graphView      
    
    getGraphView: (type, records) ->
      new Main.Graph 
        type: type
        records: records
        current_user: @getCurrentUser()
    
    getLayoutView: ->
      new Main.Layout
    
    getFilter: (type) ->
      new Main.Filter
        type: type
            
    getCurrentUser: ->
      @current_user = App.request "get:current:user"
      @current_user.fetch()
      @current_user