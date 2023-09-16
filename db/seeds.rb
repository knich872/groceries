require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying old seeds"

CartMember.destroy_all
CartItem.destroy_all
ShoppingCart.destroy_all
Item.destroy_all
User.destroy_all

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

member4 = CartMember.create!(
  user: brother,
  shopping_cart: cart
)

member5 = CartMember.create!(
  user: sister,
  shopping_cart: cart
)

member6 = CartMember.create!(
  user: brother,
  shopping_cart: cartB
)

member7 = CartMember.create!(
  user: sister,
  shopping_cart: cartS
)

puts "Cart members complete..."
puts "Creating items"

beer = Item.create!(
  name: "Kirin Lager",
  category: "drinks"
)
beer_photo_urls = ["https://products3.imgix.drizly.com/ci-kirin-lager-114156948320ecb9.jpeg?auto=format%2Ccompress&ch=Width%2CDPR&fm=jpg&q=20"]
beer_photo_urls.each do |photo|
  file = URI.open(photo)
  beer.photos.attach(io: file, filename: "photo_1.png", content_type: "image/png")
end


soda = Item.create!(
  name: "Coke Zero",
  category: "drinks"
)
soda_photo_urls = ["https://pics.walgreens.com/prodimg/416902/900.jpg"]
soda_photo_urls.each do |photo|
  file = URI.open(photo)
  soda.photos.attach(io: file, filename: "photo_1.png", content_type: "image/png")
end


cocktail = Item.create!(
  name: "Strong Zero",
  category: "drinks"
)
cocktail_photo_urls = ["https://www.wine-searcher.com/images/labels/63/09/11646309.jpg?width=260&height=260&fit=bounds&canvas=260,260"]
cocktail_photo_urls.each do |photo|
  file = URI.open(photo)
  cocktail.photos.attach(io: file, filename: "photo_1.png", content_type: "image/png")
end


puts "Items complete..."
puts "Creating cart items"

drink1 = CartItem.create!(
  item: beer,
  shopping_cart: cart,
  added_by: "Tester"
)

drink2 = CartItem.create!(
  item: soda,
  shopping_cart: cart,
  added_by: "Sister"
)

drink3 = CartItem.create!(
  item: cocktail,
  shopping_cart: cart,
  added_by: "Brother"
)

drink4 = CartItem.create!(
  item: beer,
  shopping_cart: cartB,
  added_by: "Tester"
)

drink5 = CartItem.create!(
  item: beer,
  shopping_cart: cartB,
  added_by: "Brother"
)

drink6 = CartItem.create!(
  item: soda,
  shopping_cart: cartS,
  added_by: "Tester"
)

drink7 = CartItem.create!(
  item: soda,
  shopping_cart: cartS,
  added_by: "Sister"
)

puts "Cart items complete..."
puts "All done!"
