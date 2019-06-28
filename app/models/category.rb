class Category < ApplicationRecord
  has_many :products
  belongs_to :user

  validates :name, presence: true, length: { in: 2..30 }, format: { with: /\A[A-Za-z\s]+\z/ }

  def self.total_by_quantity
    Category.find_by_sql(<<-SQL
      select categories."name",
      sum(order_items.quantity)
      from products
      join categories on products.id = categories.id
      join stocks on stocks.product_id = products.id
      join order_items on order_items.stock_id = stocks.id
      group by categories."name"
    SQL
    ).map do |row|
      [
        row['name'], row['sum']
      ]
    end
  end
end
