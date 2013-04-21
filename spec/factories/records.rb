FactoryGirl.define do
  factory :record do |f|
    amount 100
    sequence(:comment) { |n| "comment#{n}" }
    
    factory :record_income do |i|
      flow "income"
    end
    
    factory :record_expense do |i|
      flow "expense"
    end
  end
end
