class ShopItemsController < ApplicationController
  def index
    @items_available = Stock.items_available
  end
end
