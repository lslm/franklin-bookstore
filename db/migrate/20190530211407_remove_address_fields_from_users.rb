class RemoveAddressFieldsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :billing_address, :string
    remove_column :users, :billing_suburb, :string
    remove_column :users, :billing_zip, :string
    remove_column :users, :billing_state, :string
    remove_column :users, :shipping_address, :string
    remove_column :users, :shipping_suburb, :string
    remove_column :users, :shipping_zip, :string
    remove_column :users, :shipping_state, :string
  end
end
