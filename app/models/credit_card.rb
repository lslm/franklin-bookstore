# frozen_string_literal: true

class CreditCard < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :number, :expire, :cvc
end
