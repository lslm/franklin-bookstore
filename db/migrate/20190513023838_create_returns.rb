# frozen_string_literal: true

class CreateReturns < ActiveRecord::Migration[5.2]
  def change
    create_table :returns do |t|
      t.references :user, foreign_key: true
      t.references :stock, foreign_key: true
      t.string :return_reason
      t.string :status

      t.timestamps
    end
  end
end
