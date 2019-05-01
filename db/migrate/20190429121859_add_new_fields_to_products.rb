class AddNewFieldsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :author, :string
    add_column :products, :year, :string
    add_column :products, :title, :string
    add_column :products, :publisher, :string
    add_column :products, :edition, :string
    add_column :products, :isbn, :string
    add_column :products, :pages, :string
    add_column :products, :synopsis, :string
    add_column :products, :dimensions, :string
    add_column :products, :barcode, :string
    add_column :products, :active, :boolean
    add_column :products, :activation_reason, :string
  end
end
