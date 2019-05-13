class Item < ApplicationRecord
  belongs_to :product
  belongs_to :stock

  def available_quantity
    Item.where(product_id: product_id, sold: false).size
  end
end
