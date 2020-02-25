class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :last_name_furigana, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :first_name_furigana, :string, null: false
    add_column :users, :year_of_birth, :integer, null: false, limit: 4
    add_column :users, :month_of_birth, :integer, null: false, limit: 2
    add_column :users, :day_of_birth, :integer, null: false, limit: 2
    add_column :users, :delivery_last_name, :string, null: false
    add_column :users, :delivery_first_name, :string, null: false
    add_column :users, :zip, :string, null: false, limit: 8
    add_column :users, :prefectures, :string, null: false
    add_column :users, :municipality, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :building_name, :string
    add_column :users, :phone_number, :string
  end
end