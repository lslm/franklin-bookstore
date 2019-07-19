# frozen_string_literal: true

class CreateCheckoutCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :checkout_credit_cards do |t|
      t.references :checkout, foreign_key: true
      t.string :number
      t.string :name
      t.string :expire
      t.string :cvc

      t.timestamps
    end
  end
end
