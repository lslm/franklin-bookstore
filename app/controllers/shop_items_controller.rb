class ShopItemsController < ApplicationController
  def index
    @items_available = Stock.items_available
  end

  def show
    binding.pry
    @item_stock = Stock.find(params[:id])

    @order_item = current_order.order_items.new
  end
end
