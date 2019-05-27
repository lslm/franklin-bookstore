class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :pictures, as: :imageable, dependent: :delete_all
  has_many :order_items
  has_many :items

  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :name, presence: true, length: { in: 2..75 }
  validates :description, presence: true, length: { in: 10..2000 }
  validates :category_id, presence: true
  validates :user_id, presence: true

  def self.image_styles
    {
      original: "1000x", 
      product: "750x", 
      grid: "300x300#", 
      thumb: "100x" 
    }
  end
end
