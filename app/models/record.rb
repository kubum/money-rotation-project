class Record < ActiveRecord::Base
  attr_accessible :amount, :comment
    
  validates :comment, :amount, :user, :presence => true
  validates :amount, :numericality => { :greater_than => 0 }
  
  belongs_to :user
end
