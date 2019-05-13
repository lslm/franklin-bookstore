class AddCoupomCodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :coupom_code, :string
  end
end
