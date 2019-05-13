class Stock < ApplicationRecord
  belongs_to :product
  has_many :items, dependent: :destroy

  def self.items_available
    Item.where(sold: false)
  end
end
