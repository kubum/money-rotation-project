FactoryGirl.define do
  factory :user do |f|
    sequence(:email) { |n| "testemail#{n}@example.com" }
    password "password"
    password_confirmation { "password" }
  end
end
