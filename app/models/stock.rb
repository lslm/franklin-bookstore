class Stock < ApplicationRecord
  belongs_to :product

  def self.items_available
    Item.where(sold: false)
  end
end
