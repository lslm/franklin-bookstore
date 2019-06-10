class BusinessAnalysisController < ApplicationController
  def index
    @data = Category.total_by_quantity
  end
end
