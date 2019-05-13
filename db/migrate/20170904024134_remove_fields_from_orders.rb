class RemoveFieldsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :product_id, :integer
    remove_column :orders, :product_name, :integer
  end
end