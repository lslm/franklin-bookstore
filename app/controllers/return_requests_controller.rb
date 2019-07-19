# frozen_string_literal: true

class ReturnRequestsController < ApplicationController
  def index
    @return_requests = Return.all
  end

  def show
    @return_request = Return.find(params[:id])
  end

  def update
    return_request = Return.find(params[:id])

    return_request.update(return_request_params)

    if return_request_params[:status] == 'completed'
      create_coupom_for_user(return_request)
      enter_product_to_stock(return_request)
    end

    redirect_to return_requests_path
  end

  private

  def create_coupom_for_user(return_request)
    coupom_value = return_request.stock.price * return_request.quantity
    user = return_request.user
    code = rand(36**6).to_s(36)

    Coupom.create!(user: user, code: code, value: coupom_value, used: false)
  end

  def enter_product_to_stock(return_request)
    item_stock = return_request.stock
    item_stock.update(quantity: item_stock.quantity + return_request.quantity)
  end

  def return_request_params
    params.require(:return).permit(:status)
  end
end
