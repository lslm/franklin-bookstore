class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :author
      t.string :year
      t.string :title
      t.string :publisher
      t.string :edition
      t.string :isbn
      t.string :pages
      t.text :synopsis
      t.string :dimensions
      t.string :barcode
      t.boolean :active
      t.string :activation_reason

      t.timestamps
    end
  end
end
