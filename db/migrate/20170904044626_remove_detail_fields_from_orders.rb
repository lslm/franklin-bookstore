class RemoveDetailFieldsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :first_name, :string
    remove_column :orders, :last_name, :string
    remove_column :orders, :email, :string
    remove_column :orders, :address, :string
    remove_column :orders, :suburb, :string
    remove_column :orders, :zip, :string
    remove_column :orders, :state, :string
    remove_column :orders, :phone, :string
  end
end
