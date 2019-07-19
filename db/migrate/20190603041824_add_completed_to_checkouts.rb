# frozen_string_literal: true

class AddCompletedToCheckouts < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :completed, :boolean
  end
end
