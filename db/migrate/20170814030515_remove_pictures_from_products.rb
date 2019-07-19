# frozen_string_literal: true

class RemovePicturesFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :pictures, :string
  end
end
