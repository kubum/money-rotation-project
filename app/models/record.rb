class Record < ActiveRecord::Base
  attr_accessible :amount, :comment
    
  validates :comment, :amount, :presence => true
  validates :amount, :numericality => { :greater_than => 0 }
end
