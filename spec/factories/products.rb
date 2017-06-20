FactoryGirl.define do
  factory :product do
    name "puzzle name"
    price 1.00
    country_of_origin "china"
    brand "brand"
    age_group "3_12"
    category "puzzle"
    description "puzzle for family"
    stock_quantity 50
  end
end