# Users - Create Admin
User.find_or_create_by(email: "admin@admin.com") do |user|
  user.first_name = "admin"
  user.last_name = "administrator"
  user.email = "admin@admin.com"
  user.password = "password"
  user.is_admin = true
  user.telephone = 12345678
  user.address = "address"
end

# Products - Create Products
Product.create(name: Faker::ChuckNorris.fact, price: 1.00, country_of_origin: "Singapore", brand: "lego", age_group: "3-4", category: "puzzle", description: "puzzle for family", stock_quantity: 50 )

product_count = 100
if Product.count < product_count + 1
  (product_count - Product.count).times do
    name = Faker::Book.title
    price = Faker::Number.decimal(2)
    country_of_origin = Faker::Address.country
    brand = ["Lego", "Nintendo", "Mattel", "Hasbro", "Nerf", "MEGA Bloks", "Fisher Price", "Tiger Electronics", "Playmobil", "Kenner"].sample
    age_group = ["1-2", "3-4", "5-7", "8-11", "12-14"].sample
    category = ["role_play", "vehicles", "outdoor", "wheels", "dolls", "craft", "building", "puzzle"].sample
    description = Faker::HarryPotter.quote
    stock_quantity = Faker::Number.between(0, 999)

    Product.create(name: name, price: price, country_of_origin: country_of_origin, brand: brand, age_group: age_group, category: category, description: description, stock_quantity: stock_quantity)
  end
end