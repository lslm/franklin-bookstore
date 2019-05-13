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

    #gerar cupom de troca

    redirect_to return_requests_path
  end

  private

  def return_request_params
    params.require(:return).permit(:status)
  end
end