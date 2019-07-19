# frozen_string_literal: true

class AddCreditCardToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :credit_card_number, :string
    add_column :users, :credit_card_name, :string
    add_column :users, :credit_card_expire_date, :string
    add_column :users, :credit_card_ccv, :string
  end
end
