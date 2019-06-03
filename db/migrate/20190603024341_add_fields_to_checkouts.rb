class AddFieldsToCheckouts < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :billing_number, :string
    add_column :checkouts, :shipping_number, :string
  end
end
