FactoryGirl.define do
  factory :order do
    association :user, factory: :user
    order_value 30
    status 1
  end
end
