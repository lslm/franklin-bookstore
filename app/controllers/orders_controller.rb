# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authorize, only: %i[index show]
  before_action :authorize_admin, only: %i[index edit]

  def index
    @orders = Checkout.where(completed: true).order('created_at DESC')
  end

  def show
    @order = Checkout.find(params[:id])
  end

  def update
    @checkout = Checkout.find(params[:id])
    @checkout.update(orders_params)
    redirect_to orders_path
  end

  private

  def orders_params
    params.require(:checkout).permit(:status)
  end
end
