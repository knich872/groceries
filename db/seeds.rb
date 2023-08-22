require "open-uri"
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
Item.destroy_all
CartItem.destroy_all

puts "Creating users"

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

puts "Users complete!"
puts "Creating shopping carts"

cart = ShoppingCart.create!(
  name: "My cart",
)

cartB = ShoppingCart.create!(
  name: "My brother's cart",
  )

cartS = ShoppingCart.create!(
  name: "My sister's cart",
  )

puts "Shopping carts complete..."
puts "Creating cart members"

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

puts "Cart members complete..."
puts "Creating items"

beer = Item.create!(
  name: "Kirin Lager"
)
beer_photo_url = "https://products3.imgix.drizly.com/ci-kirin-lager-114156948320ecb9.jpeg?auto=format%2Ccompress&ch=Width%2CDPR&fm=jpg&q=20"
file = URI.open(beer_photo_url)
beer.photo.attach(io: file, filename: "photo_1.png", content_type: "image/png")


soda = Item.create!(
  name: "Coke Zero"
)
soda_photo_url = "https://pics.walgreens.com/prodimg/416902/900.jpg"
file = URI.open(soda_photo_url)
soda.photo.attach(io: file, filename: "photo_1.png", content_type: "image/png")


cocktail = Item.create!(
  name: "Strong Zero"
)
cocktail_photo_url = "https://www.wine-searcher.com/images/labels/63/09/11646309.jpg?width=260&height=260&fit=bounds&canvas=260,260"
file = URI.open(cocktail_photo_url)
cocktail.photo.attach(io: file, filename: "photo_1.png", content_type: "image/png")


puts "Items complete..."
puts "Creating cart items"

drink1 = CartItem.create!(
  item: beer,
  shopping_cart: cart,
  added_by: tester
)

drink2 = CartItem.create!(
  item: soda,
  shopping_cart: cart,
  added_by: sister
)

drink3 = CartItem.create!(
  item: cocktail,
  shopping_cart: cart,
  added_by: brother
)

drink4 = CartItem.create!(
  item: beer,
  shopping_cart: cartB,
  added_by: tester
)

drink5 = CartItem.create!(
  item: beer,
  shopping_cart: cartB,
  added_by: brother
)

drink6 = CartItem.create!(
  item: soda,
  shopping_cart: cartS,
  added_by: tester
)

drink7 = CartItem.create!(
  item: soda,
  shopping_cart: cartS,
  added_by: sister
)

puts "Cart items complete..."
puts "All done!"
