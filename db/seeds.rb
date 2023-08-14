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
brother = User.create!(
  username: "Brother",
  email: "brother@groceries.com",
  password: "123456"
)

sister = User.create!(
  username: "Sister",
  email: "sister@groceries.com",
  password: "123456"
)

cart = ShoppingCart.create!(
  name: "My cart",
  shopping_list: []
)

cartB = ShoppingCart.create!(
  name: "My brother's cart",
  shopping_list: []
  )

cartS = ShoppingCart.create!(
  name: "My sister's cart",
  shopping_list: []
  )

member = CartMember.create!(
  user: tester,
  shopping_cart: cart
)

member2 = CartMember.create!(
  user: tester,
  shopping_cart: cartB
)

member3 = CartMember.create!(
  user: tester,
  shopping_cart: cartS
)

memberb = CartMember.create!(
  user: brother,
  shopping_cart: cartB
)

members = CartMember.create!(
  user: sister,
  shopping_cart: cartS
)

puts "All done!"
