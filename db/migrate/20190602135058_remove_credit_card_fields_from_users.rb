# frozen_string_literal: true

class RemoveCreditCardFieldsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :credit_card_number, :string
    remove_column :users, :credit_card_name, :string
    remove_column :users, :credit_card_expire_date, :string
    remove_column :users, :credit_card_ccv, :string
  end
end
