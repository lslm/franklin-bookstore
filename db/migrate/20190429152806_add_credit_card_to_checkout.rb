class AddCreditCardToCheckout < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :credit_card_number, :string
    add_column :checkouts, :credit_card_name, :string
    add_column :checkouts, :credit_card_expire_date, :string
    add_column :checkouts, :credit_card_ccv, :string
  end
end
