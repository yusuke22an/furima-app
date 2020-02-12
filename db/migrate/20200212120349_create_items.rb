class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.string :status, null: false
      t.string :brand_name
      t.string :shipping_charges, null: false
      t.string :shipping_area, null: false
      t.string :days_to_ship, null: false
      t.integer :price, null: false
      t.integer :saler_id, null: false, foreign_key: true, class_name: "User"
      t.integer :buyer_id, null: false, foreign_key: true, class_name: "User"
      t.timestamps
    end
  end
end
