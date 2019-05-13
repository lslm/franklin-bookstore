class RemoveTotalFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :total, :decimal
  end
end
