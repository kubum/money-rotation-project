class RecordsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if !params[:flow].nil? && params[:flow] == "income"
      @records = current_user.records.income
    elsif !params[:flow].nil? && params[:flow] == "expense"
      @records = current_user.records.expense
    else !params[:flow].nil? && params[:flow] == "income"
      @records = current_user.records
    end
    
    @records = @records.order("id DESC")
  end
  
  def show

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
    @record = current_user.records.find(params[:id])
    @record.destroy
  end
end
