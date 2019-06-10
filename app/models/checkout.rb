class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :order, autosave: true

  def total
    self.order.order_items.pluck(:total_price).reduce(:+)
  end
end
