# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   :first_name,         null: false
      t.string   :last_name,          null: false
      t.string   :gender,             null: false
      t.datetime :birthdate,        null: false
      t.string   :cpf,                null: false
      t.string   :phone_number,       null: false
      t.string   :email,              null: false
      t.string   :encrypted_password, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :cpf,                  unique: true
    add_index :users, :confirmation_token,   unique: true
  end
end
