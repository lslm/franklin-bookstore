class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)

    existing_order = @order.order_items.where(stock_id: params[:order_item][:stock_id])
    if existing_order.count >= 1
      existing_order.last.update_column(:quantity, existing_order.last.quantity + params[:order_item][:quantity].to_i)
    else
      @order.save
    end
    session[:order_id] = @order.id

    redirect_to cart_path
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items

    redirect_to cart_path
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items

    redirect_to cart_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :stock_id)
  end
end
