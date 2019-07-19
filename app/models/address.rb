# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user

  validates_presence_of(
    :name, :street, :number, :zip_code, :city, :state, :address_type
  )
end
