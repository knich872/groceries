class AddAddedByToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :added_by, :string
  end
end
