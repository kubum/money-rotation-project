class RecordsController < ApplicationController
  # before_filter :authenticate_user!
  
  def index
    @records = Record.all
  end
end
