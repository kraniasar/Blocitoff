FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "amanda#{n}@blocitoff.com" }
    password "password"
  end
end
