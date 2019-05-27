class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :pictures, as: :imageable, dependent: :delete_all
  has_many :order_items
  has_many :items

  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :author, presence: true
  validates :year, presence: true
  validates :publisher, presence: true
  validates :edition, presence: true
  validates :isbn, presence: true
  validates :pages, presence: true
  validates :dimensions, presence: true
  validates :barcode, presence: true
  validates :activation_reason, presence: true

  def self.image_styles
    {
      original: "1000x", 
      product: "750x", 
      grid: "300x300#", 
      thumb: "100x" 
    }
  end
end
