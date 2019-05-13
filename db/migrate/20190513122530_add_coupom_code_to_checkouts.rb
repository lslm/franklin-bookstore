class AddCoupomCodeToCheckouts < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :coupom_code, :string
  end
end
