# frozen_string_literal: true

class CheckoutCreditCard < ApplicationRecord
  belongs_to :checkout
end
