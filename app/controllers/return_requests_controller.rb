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

    create_coupom_for_user(return_request)

    redirect_to return_requests_path
  end

  private

  def create_coupom_for_user(return_request)
    coupom_value = return_request.item.stock.price
    user = return_request.user
    code = rand(36**6).to_s(36)

    Coupom.create!(user: user, code: code, value: coupom_value, used: false)
  end

  def return_request_params
    params.require(:return).permit(:status)
  end
end