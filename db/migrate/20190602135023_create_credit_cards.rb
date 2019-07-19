# frozen_string_literal: true

class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.references :user, foreign_key: true
      t.string :number
      t.string :name
      t.string :expire
      t.string :cvc

      t.timestamps
    end
  end
end
