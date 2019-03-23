class CreatePriceGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :price_groups do |t|
      t.string :prefix
      t.string :description

      t.timestamps
    end
  end
end
