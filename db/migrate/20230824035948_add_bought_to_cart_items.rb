class AddBoughtToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :bought, :integer, default: 0
  end
end
