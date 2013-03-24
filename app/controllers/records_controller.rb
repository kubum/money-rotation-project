class RecordsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @records = current_user.records
  end
  
  def show
    respond_with Record.find(params[:id])
  end
  
  def create
    @record = current_user.records.create(params[:record])
    
    if @record.save
      render :json => @record
    else
      render :json => { :errors => @record.errors.full_messages }, :status => 422
    end
  end
  
  def update
    respond_with Record.update(params[:id], params[:record])
  end
  
  def destroy
    respond_with Record.destroy(params[:id])
  end
end
