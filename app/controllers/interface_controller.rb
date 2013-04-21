class InterfaceController < ApplicationController
  before_filter :authenticate_user!
  layout "interface"
  
  def index
    # Backbone application starts
  end
end