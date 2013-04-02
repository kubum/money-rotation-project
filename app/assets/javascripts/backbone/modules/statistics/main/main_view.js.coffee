@Page.module "StatisticsApp.Main", (Main, App, Backbone, Marionette, $, _) ->
  
  class Main.Show extends App.Views.ItemView
    template: JST["backbone/modules/statistics/main/templates/show"]
    
    events:
      'click #by_week': "byWeek"
      'click #by_month': "byMonth"
      'click #by_all': "byAll"
      
    initialize: ->
      @records = @options.records
      @current_user = @options.current_user
                
    onShow: ->
      @byWeek()
          
    byWeek: ->
      @selectMenu("#by_week")
      
      # Count from last Monday
      if Date.today().is().monday()
        from = Date.today()
      else
        from = Date.today().last().monday()
      
      # till next Sunday
      till = Date.today().next().monday().getTime()
            
      @drawPlot from, till, "day"
    
    byMonth: ->
      @selectMenu("#by_month")
      
      from = Date.today().moveToFirstDayOfMonth()
      till = Date.today().moveToLastDayOfMonth().addDays(1)
      
      @drawPlot from, till, "day"
    
    byAll: ->
      @selectMenu("#by_all")
      
      from = @current_user.get('created_at') * 1000
      till = Date.now().getTime()
            
      @drawPlot from, till, "month"
          
    selectMenu: (menu) ->
      @$el.find(".filter li").removeClass("active")
      @$el.find(menu).parent("li").addClass("active")
      
    poundFormatter: (value, axis) ->
      "&pound;" + value.toFixed(axis.tickDecimals);
      
    data: ->
      [  
        { data: @records.income, label: "Income", color: "#58D458" },
        { data: @records.expense, label: "Expense", color: "#E1212F" }
      ]
    
    drawPlot: (from, till, tick) ->
      $.plot "#placeholder", @data(),
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