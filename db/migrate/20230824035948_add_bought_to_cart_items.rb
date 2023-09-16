class AddBoughtToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :bought, :string
  end
end
