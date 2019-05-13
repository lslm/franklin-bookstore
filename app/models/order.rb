class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  #belongs_to :checkout, optional: true
  has_many :order_items

  before_create :set_order_status
  before_save :set_gst, :set_tax, :update_subtotal

  # validates :total, presence: true
  # validates :tax, presence: true
  # validates :gst, presence: true

  def subtotal
    coupom = Coupom.find_by_code(self[:coupom_code])
    total = order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
    total = total - coupom.value if coupom

    total
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    coupom = Coupom.find_by_code(self[:coupom_code])
    self[:subtotal] = subtotal - coupom.value if coupom
  end

  def set_gst
    self[:gst] = 10
  end

  def set_tax
    self[:tax] = 1
  end
end
