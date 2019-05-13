class Item < ApplicationRecord
  belongs_to :product
  belongs_to :stock
end
