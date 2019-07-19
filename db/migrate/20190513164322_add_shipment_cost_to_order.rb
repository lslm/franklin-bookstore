# frozen_string_literal: true

class AddShipmentCostToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipment_cost, :decimal
  end
end
