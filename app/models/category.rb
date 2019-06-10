class Category < ApplicationRecord
  has_many :products
  belongs_to :user

  validates :name, presence: true, length: { in: 2..30 }, format: { with: /\A[A-Za-z\s]+\z/ }

  has_attached_file :image, 
    styles: { 
      original: "300x" 
    }, 
    :url => "/pictures/categories/:id/:style/:filename", 
    :path => ":rails_root/public/pictures/categories/:id/:style/:filename",
    :convert_options => {
      :original => "-strip",
    },
    default_url: "/images/missing.png"
  
  validates_attachment :image, 
    presence: true,
    content_type: { 
      content_type: ["image/jpeg", "image/jpg", "image/png"] 
    }, 
    size: {
      less_than: 10.megabytes 
    },
    if: Proc.new {|a| a.image.present? }
  
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
