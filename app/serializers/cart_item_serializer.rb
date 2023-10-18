class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :shopping_cart_id, :updated_at, :added_by, :bought, :bought_by
  belongs_to :item
  belongs_to :shopping_cart
end
