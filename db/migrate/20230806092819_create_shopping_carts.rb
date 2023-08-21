class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts do |t|
      t.string :name
      t.string :item_ids, array: true, default: []

      t.timestamps
    end
  end
end
