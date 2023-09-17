class AddBoughtByToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :bought_by, :string, default: ""
  end
end
