# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying old seeds"

User.destroy_all
ShoppingCart.destroy_all
CartMember.destroy_all

puts "Creating new seeds"

tester = User.create!(
  username: "Tester",
  email: "tester@groceries.com",
  password: "123456"
)

cart = ShoppingCart.create!(
  name: "My cart",
  shopping_list: []
)

member = CartMember.create!(
  user: tester,
  shopping_cart: cart
)

puts "All done!"
