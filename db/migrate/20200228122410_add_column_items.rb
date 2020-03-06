class AddColumnItems < ActiveRecord::Migration[5.2]
  def up
    add_column :items, :category_id, :int
  end
end
