class BillingAddressController < ApplicationController
  def new
    @checkout = Checkout.new
    @order = Order.find(params[:order_id])
    @addresses = current_user.addresses.where(address_type: :billing)

    @billing_address = current_user.addresses.find(params[:address_id]) if params[:address_id]
  end

  def create
    @checkout = Checkout.new(
      billing_address: checkout_billing_address_params[:billing_address],
      billing_number: checkout_billing_address_params[:billing_number],
      billing_zip: checkout_billing_address_params[:billing_zip],
      billing_suburb: checkout_billing_address_params[:billing_suburb],
      billing_state: checkout_billing_address_params[:billing_state]
    )

    @checkout.save

    if params[:save_address]
      address = current_user.addresses.build(
        street: checkout_billing_address_params[:billing_address],
        number: checkout_billing_address_params[:billing_number],
        zip_code: checkout_billing_address_params[:billing_zip],
        city: checkout_billing_address_params[:billing_suburb],
        state: checkout_billing_address_params[:billing_state],
        address_type: :billing,
        name: 'FROM CHECKOUT'
      )

      address.save!
    end

    redirect_to new_shipping_address_path(checkout_id: @checkout.id)
  end

  private

  def checkout_billing_address_params
    params.require(:checkout).permit(
      :billing_address, :billing_number, :billing_state, :billing_suburb, :billing_zip, :save_address
    )
  end
end