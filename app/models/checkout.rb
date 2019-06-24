class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :order, autosave: true

  def total
    self.order.order_items.pluck(:total_price).reduce(:+)
  end

  def self.count_items_sold(initial_date, end_date)
    query = <<-SQL
      select TO_CHAR(checkouts.created_at :: DATE, 'dd/mm/yyyy') as date,
      products."name",
      sum(order_items.quantity) as quantity
      from checkouts
      join order_items on order_items.order_id = checkouts.order_id
      join stocks on stocks.id = order_items.stock_id
      join products on products.id = stocks.product_id
    SQL

    query = "#{query} #{build_query_condition(initial_date, end_date)} group by 1,2"

    data = Checkout.find_by_sql(query).map do |row|
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

  def self.build_query_condition(initial_date, end_date)
    condition = ""
    return condition if initial_date.nil? && end_date.nil?

    if !initial_date.empty?
      condition = "WHERE checkouts.created_at >= '#{initial_date}'::date"
    end

    if !end_date.empty?
      condition = "#{condition} AND checkouts.created_at < ('#{end_date}'::date + '1 day'::interval)"
    end

    condition
  end
end
