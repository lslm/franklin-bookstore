class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :order, autosave: true

  def total
    self.order.order_items.pluck(:total_price).reduce(:+)
  end

  def self.count_items_sold
    data = Checkout.find_by_sql(<<-SQL
      select TO_CHAR(checkouts.created_at :: DATE, 'dd/mm/yyyy') as date,
      products."name",
      sum(order_items.quantity) as quantity
      from checkouts
      join order_items on order_items.order_id = checkouts.order_id
      join stocks on stocks.id = order_items.stock_id
      join products on products.id = stocks.product_id
      group by 1,2
    SQL
    ).map do |row|
      {dia: row['date'], nome: row['name'], quantidade: row['quantity']}
    end

    data = data.group_by { |i| i[:dia]}.to_a

    data.map do |d|
      [d[0]] + formalize_data(d)
    end
  end

  def self.formalize_data(data)
    books = Product.order(:name).pluck(:name)

    sold_books = data[1].map do |item|
      {item[:nome] => item[:quantidade]}
    end

    sold_books = sold_books.inject(:merge)

    books.map do |book|
      if sold_books.key?(book)
        sold_books[book]
      else
        0
      end
    end
  end
end
