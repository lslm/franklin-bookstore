# frozen_string_literal: true

class AddUserIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :user_id, :integer
  end
end
