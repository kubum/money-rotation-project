class Record < ActiveRecord::Base
  attr_accessible :amount, :comment, :flow
    
  validates :comment, :amount, :user, :flow, :presence => true
  validates :amount, :numericality => { :greater_than => 0 }
  validates :flow, :inclusion => { :in => %w(income expense) }
  
  belongs_to :user
end
