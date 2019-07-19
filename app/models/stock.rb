# frozen_string_literal: true

class Stock < ApplicationRecord
  belongs_to :product
  has_many :items, dependent: :destroy

  def self.items_available
    where('quantity > 0')
  end
end
