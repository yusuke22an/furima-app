class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :saler_id,:int, null: true # null: trueを明示する必要がある
    change_column :items, :buyer_id,:int, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :items, :saler_id,:int, null: false
    change_column :items, :buyer_id,:int, null: false
  end
end