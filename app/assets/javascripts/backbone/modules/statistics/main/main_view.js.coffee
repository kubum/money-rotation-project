@Page.module "StatisticsApp.Main", (Main, App, Backbone, Marionette, $, _) ->
  
  class Main.Layout extends App.Views.Layout
    template: JST["backbone/modules/statistics/main/templates/layout"]
    
    regions:
      filterRegion: "#filter-region"
      graphRegion: "#graph-region"
      
  class Main.Filter extends App.Views.ItemView
    template: JST["backbone/modules/statistics/main/templates/filter"]
      
    events:
      'click #by_week': "byWeek"
      'click #by_month': "byMonth"
      'click #by_all': "byAll"
    
    onShow: ->
      if @options.type is "week"  then @selectMenu("#by_week")      
      if @options.type is "month" then @selectMenu("#by_month")        
      if @options.type is "all"   then @selectMenu("#by_all")
      
    selectMenu: (menu) ->
      @$el.find(".filter li").removeClass("active")
      @$el.find(menu).parent("li").addClass("active")
      
    byWeek: ->      
      App.navigate("#statistics/week", trigger: true)
      false
    
    byMonth: ->
      App.navigate("#statistics/month", trigger: true)
      false
    
    byAll: ->      
      App.navigate("#statistics/all", trigger: true)
      false
    
  class Main.Graph extends App.Views.ItemView
    template: JST["backbone/modules/statistics/main/templates/graph"]
    
    initialize: ->
      @type         = @options.type
      @records      = @options.records
      @current_user = @options.current_user
    
    onShow: ->
      if @type is "week"
        @byWeek()
      
      if @type is "month"
        @byMonth()
        
      if @type is "all"
        @byAll()
    
    byWeek: ->         
      # Count from last Monday
      if Date.today().is().monday()
       from = Date.today()
      else
       from = Date.today().last().monday()

      # till next Sunday
      till = Date.today().next().monday().getTime()
   
      @drawPlot from, till, "day"

    byMonth: ->
      from = Date.today().moveToFirstDayOfMonth()
      till = Date.today().moveToLastDayOfMonth().addDays(1)
      
      @drawPlot from, till, "day"

    byAll: ->      
      from = @current_user.get('created_at') * 1000
      till = Date.now().getTime()
            
      @drawPlot from, till, "month"
    
    poundFormatter: (value, axis) ->
      "&pound;" + value.toFixed(axis.tickDecimals);

    data: ->
      [  
        { data: @records.income, label: "Income", color: "#58D458" },
        { data: @records.expense, label: "Expense", color: "#E1212F" }
      ]

    drawPlot: (from, till, tick) ->
      $.plot @$el.find("#placeholder"), @data(),
        series: 
          lines: 
            show: true
          points: 
            show: true            
        xaxis:
          mode: "time"
          min: from
          max: till
          minTickSize: [1, tick]
        yaxis:
          min: 0
          tickFormatter: @poundFormatter  