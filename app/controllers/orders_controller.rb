class OrdersController < ApplicationController
  before_action :authorize, only: [:index, :show]
  before_action :authorize_admin, only: [:index, :edit]

  def index
    @orders = Checkout.all.order("created_at DESC")
  end

  def show
    @order = Checkout.find_by_slug(params[:id])
  end

  def update
    @checkout = Checkout.find_by_slug(params[:id])

		@checkout.update(orders_params)

		redirect_to orders_path
  end

  private

  def orders_params
    params.require(:checkout).permit(:status)
  end
end
