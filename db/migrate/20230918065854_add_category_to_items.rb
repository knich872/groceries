class AddCategoryToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :category, :integer, null: false
  end
end
