class BusinessAnalysisController < ApplicationController
  def index
    @data = Category.total_by_quantity

    @books = Product.all.order(:name).pluck(:name)
    @line_chart_data = Checkout.count_items_sold
  end
end