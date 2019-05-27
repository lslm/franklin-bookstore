class RemoveFieldsFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :price, :decimal
    remove_column :products, :old_price, :decimal
    remove_column :products, :on_sale, :boolean
    remove_column :products, :sold_out, :boolean
    remove_column :products, :featured, :boolean
    remove_column :products, :synopsis, :text
  end
end
