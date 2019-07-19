# frozen_string_literal: true

class CreateUploadsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads, &:timestamps
  end
end
