FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "first_name#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    sequence(:address) { |n| "address#{n}" }
    is_admin false
    telephone 1_234_567
    password '123123'
  end
end
