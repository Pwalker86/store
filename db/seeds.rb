# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "******* Creating Users *****"
3.times do |i|
  u = User.new(email: "user#{i}@email.com", password: "test123", username: "user#{i}")
  if u.save!
    puts "#{u.username} created"
  else
    puts "User not created"
  end
end

puts "******* Creating Admins *****"
3.times do |i|
  a = Admin.new(email: "admin#{i}@email.com", password: "test123", username: "admin#{i}")
  if a.save!
    puts "#{a.username} created"
  else
    puts "User not created"
  end
end

puts "******* Creating Products *****"
10.times do |i|
  p = Product.new(name: "Product #{i}", price: 100, description: "This is a product description")
  if p.save!
    puts "#{p.name} created"
  else
    puts "Product not created"
  end
end
