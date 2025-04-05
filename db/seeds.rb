# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

fraise = Product.new(name: fraise, price: 3)
bannane = Product.new(name: bannane, price: 8)
pomme = Product.new(name: pomme, price: 5)
fraise.save!
bannane.save!
pomme.save!

fraise_reduction = Reduction.new(amount: 50, product_id: fraise.id)
bannane_reduction = Reduction.new(amount: 50, product_id: bannane.id)
fraise_reduction.save!
bannane_reduction.save!
