# frozen_string_literal: true

class AddItemIdToOrderItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :product_id, :stock_id
    add_foreign_key :order_items, :stocks
  end
end
