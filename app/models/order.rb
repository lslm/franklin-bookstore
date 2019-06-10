class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  #belongs_to :checkout, optional: true
  has_many :order_items

  before_create :set_order_status

  # validates :total, presence: true
  # validates :tax, presence: true
  # validates :gst, presence: true

  private

  def set_order_status
    self.order_status_id = 1
  end
end
