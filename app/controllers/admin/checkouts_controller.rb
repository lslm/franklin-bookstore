class Admin::CheckoutsController < ApplicationController
	before_action :authorize
	before_action :authorize_admin

  def index
		@checkouts = Checkout.all.order("created_at DESC")
	end

  def show
		@checkout = Checkout.find_by_id(params[:id])
  end
  
	def update
		@checkout = Checkout.find_by_id(params[:id])

		@checkout.update(checkout_params)

		redirect_to checkouts_path
  end

	private

	def checkout_params
		params.require(:checkout).permit(:status)
	end
end
