# frozen_string_literal: true

class AddQuantityToReturns < ActiveRecord::Migration[5.2]
  def change
    add_column :returns, :quantity, :integer
  end
end
