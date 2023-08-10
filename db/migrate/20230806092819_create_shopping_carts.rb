class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts do |t|
      t.string :name
      t.string :shopping_list, array: true, default: []

      t.timestamps
    end
  end
end
