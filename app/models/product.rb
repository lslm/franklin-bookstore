class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :order_items
  has_many :items

  has_many_attached :images

  validates_presence_of(
    :name, :description, :category_id, :user_id, :author,
    :year, :publisher, :edition, :isbn, :pages, :dimensions,
    :barcode, :activation_reason
  )
end
