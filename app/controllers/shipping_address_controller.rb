# frozen_string_literal: true

class ShippingAddressController < ApplicationController
  def new
    @checkout = Checkout.find(params[:checkout_id])
    @addresses = current_user.addresses.where(address_type: :shipping)

    @shipping_address = current_user.addresses.find(params[:address_id]) if params[:address_id]
  end

  def create
    @checkout = Checkout.find(params[:checkout_id])
    @checkout.shipping_address = checkout_shipping_address_params[:shipping_address]
    @checkout.shipping_number = checkout_shipping_address_params[:shipping_number]
    @checkout.shipping_zip = checkout_shipping_address_params[:shipping_zip]
    @checkout.shipping_suburb = checkout_shipping_address_params[:shipping_suburb]
    @checkout.shipping_state = checkout_shipping_address_params[:shipping_state]

    @checkout.save!

    if params[:save_address]
      address = current_user.addresses.build(
        street: checkout_shipping_address_params[:shipping_address],
        number: checkout_shipping_address_params[:shipping_number],
        zip_code: checkout_shipping_address_params[:shipping_zip],
        city: checkout_shipping_address_params[:shipping_suburb],
        state: checkout_shipping_address_params[:shipping_state],
        address_type: :shipping,
        name: 'FROM CHECKOUT'
      )

      address.save!
    end

    redirect_to new_payment_path(checkout_id: @checkout.id)
  end

  private

  def checkout_shipping_address_params
    params.require(:checkout).permit(
      :shipping_address, :shipping_number, :shipping_state, :shipping_suburb, :shipping_zip, :save_address
    )
  end
end
