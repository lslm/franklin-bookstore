class AddItemIdToOrderItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :product_id, :item_id
    add_foreign_key :order_items, :items
  end
end
