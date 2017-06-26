FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "puzzle name#{n}" }
    price 1.00
    country_of_origin "China"
    brand "Lego"
    age_group "3_12"
    category "puzzle"
    description "puzzle for family"
    stock_quantity 50
  end
end