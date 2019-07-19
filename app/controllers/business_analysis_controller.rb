# frozen_string_literal: true

class BusinessAnalysisController < ApplicationController
  def index
    @data = Category.total_by_quantity

    @books = Product.all.order(:name).pluck(:name)

    @line_chart_data = Checkout.count_items_sold(params['initial_date'], params['end_date'])
  end
end
