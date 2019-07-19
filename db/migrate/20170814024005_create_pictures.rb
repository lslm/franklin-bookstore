# frozen_string_literal: true

class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures, &:timestamps
  end
end
