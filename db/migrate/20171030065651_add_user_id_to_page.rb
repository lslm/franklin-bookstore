# frozen_string_literal: true

class AddUserIdToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :user_id, :integer
  end
end
