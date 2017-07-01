# Create Admin user
User.find_or_create_by(email: 'admin@admin.com') do |user|
  user.first_name = 'admin'
  user.last_name = 'administrator'
  user.email = 'admin@admin.com'
  user.password = 'password'
  user.is_admin = true
  user.telephone = 12_345_678
  user.address = Faker::Address.street_address
end

# Create 2 standard users
user1 = User.find_or_create_by(email: 'demo@demo.com') do |user|
  user.first_name = 'demo'
  user.last_name = 'demostrator'
  user.email = 'demo@demo.com'
  user.password = '123456'
  user.is_admin = false
  user.telephone = 12_345_678
  user.address = Faker::Address.street_address
end

user2 = User.find_or_create_by(email: 'demo2@demo.com') do |user|
  user.first_name = 'demo2'
  user.last_name = 'demostrator'
  user.email = 'demo2@demo.com'
  user.password = '123456'
  user.is_admin = false
  user.telephone = 12_345_678
  user.address = Faker::Address.street_address
end

# Create cart for each user except Admin
  Cart.find_or_create_by(user_id: user1.id) do |cart|
    cart.user_id = user1.id
  end
  Cart.find_or_create_by(user_id: user2.id) do |cart|
    cart.user_id = user2.id
  end

# Create Products
product_count = 30
if Product.count < product_count + 1
  (product_count - Product.count).times do
    name = Faker::Book.title
    price = Faker::Number.decimal(2)
    country_of_origin = ['CN','MY','TH','PH'].sample
    brand = ['Lego', 'Nintendo', 'Mattel', 'Hasbro', 'Nerf', 'MEGA Bloks', 'Fisher Price', 'Tiger Electronics', 'Playmobil', 'Kenner'].sample
    age_group = ['1-2', '3-4', '5-7', '8-11', '12-14'].sample
    category = %w[role_play vehicles outdoor wheels dolls craft building puzzle].sample
    description = Faker::HarryPotter.quote
    stock_quantity = Faker::Number.between(1, 999)

    product = Product.create(name: name, price: price, country_of_origin: country_of_origin, brand: brand, age_group: age_group, category: category, description: description, stock_quantity: stock_quantity)
  end
end

# Create Orders
order_count = 20
if Order.count < order_count + 1
  (order_count - Order.count).times do
    order_status = Faker::Number.between(1, 4)
    user_id = Faker::Number.between(2, 3)
    @order = Order.create(user_id: user_id, status: order_status)

    # Create OrderProducts belong to the order just created
    orderproduct_count = Faker::Number.between(5, 10)
    orderproduct_count.times do
      product_id = Faker::Number.between(1, Product.count)
      order_id = @order.id
      purchase_quantity = 1
      n = Faker::Number.between(0, 30)
      order = OrderProduct.create(product_id: product_id, order_id: order_id, purchase_quantity: purchase_quantity)
      order[:created_at] = order[:created_at] - n.days
      order.save
    end

    # Update the order_value for the order
    @order_value = @order.order_value
    @orderproducts = OrderProduct.where(order_id: @order.id)
    @orderproducts.each do |orderproduct|
      @order_value += Product.find(orderproduct.product_id).price * orderproduct.purchase_quantity
    end
    @order.update(order_value: @order_value)
  end
end