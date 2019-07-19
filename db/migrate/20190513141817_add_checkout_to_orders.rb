# frozen_string_literal: true

class AddCheckoutToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :checkout, foreign_key: true
  end
end
