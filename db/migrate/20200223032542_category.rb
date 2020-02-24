class Category < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :name, :string
    add_index :categories, :name
  end
end
