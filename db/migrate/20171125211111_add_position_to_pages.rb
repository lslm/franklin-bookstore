# frozen_string_literal: true

class AddPositionToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :position, :integer
  end
end
