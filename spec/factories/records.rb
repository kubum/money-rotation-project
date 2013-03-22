# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :record, :class => 'Records' do
    amount 1
    comment "MyString"
  end
end
