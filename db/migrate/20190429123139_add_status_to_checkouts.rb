class AddStatusToCheckouts < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :status, :string
  end
end
