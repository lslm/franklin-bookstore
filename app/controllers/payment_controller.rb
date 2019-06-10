class PaymentController < ApplicationController
  def new
    @checkout = Checkout.find(params[:checkout_id])
    @credit_cards = current_user.credit_cards.all

    @credit_card = current_user.credit_cards.find(params[:credit_card_id]) if params[:credit_card_id]
  end

  def create
    @checkout = Checkout.find(params[:checkout_id])
    @checkout.credit_card_number = checkout_payment_params[:credit_card_number]
    @checkout.credit_card_name = checkout_payment_params[:credit_card_name]
    @checkout.credit_card_ccv = checkout_payment_params[:credit_card_ccv]
    @checkout.credit_card_expire_date = checkout_payment_params[:credit_card_expire_date]
    @checkout.order = current_order
    @checkout.user = current_user

    @checkout.save!

    if params[:save_credit_card]
      credit_card = current_user.credit_cards.build(
        number: checkout_payment_params[:credit_card_number],
        name: checkout_payment_params[:credit_card_name],
        cvc: checkout_payment_params[:credit_card_ccv],
        expire: checkout_payment_params[:credit_card_expire_date]
      )

      credit_card.save!
    end

    redirect_to summary_index_path(checkout_id: @checkout.id)
  end

  private

  def checkout_payment_params
    params.require(:checkout).permit(
      :credit_card_number, :credit_card_name, :credit_card_ccv, :credit_card_expire_date, :save_credit_card, :checkout_id
    )
  end
end