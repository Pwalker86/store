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
  begin
    a.save!
    puts "******** Admin: #{a.username} created ********* "
    s = Store.new(name: "Admin #{a.username} store", location: Faker::Address.city, phone_number: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, admin_id: a.id)
    s.save!
    puts "******** Store: #{s.name} created *********"
    10.times do |i|
      p = Product.new(name: Faker::Movie.title, price: 100, description: Faker::Lorem.sentence(word_count: 10), store_id: s.id)
      p.save!
      puts "*********** Product: #{ p.name} created **********"
    end
  rescue StandardError => exception
    puts "User not created: #{exception}"
  end
end
