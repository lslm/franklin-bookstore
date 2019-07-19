# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.string :lot

      t.timestamps
    end
  end
end
