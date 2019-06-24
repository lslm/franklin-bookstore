class PaymentController < ApplicationController
  def new
    @checkout = Checkout.find(params[:checkout_id])
    @credit_cards = current_user.credit_cards.all
    @credit_card = current_user.credit_cards.find(params[:credit_card_id]) if params[:credit_card_id]
  end

  def create
    @checkout = Checkout.find(params[:checkout_id])

    @checkout.checkout_credit_cards.build(
      number: checkout_payment_params[:number1],
      name: checkout_payment_params[:name1],
      expire: checkout_payment_params[:expire_date1],
      cvc: checkout_payment_params[:ccv1]
    )

    @checkout = save_second_credit_card(@checkout)

    @checkout.order = current_order
    @checkout.user = current_user

    @checkout.save!

    if params[:save_credit_card]
      credit_card = current_user.credit_cards.build(
        number: checkout_payment_params[:number1],
        name: checkout_payment_params[:name1],
        cvc: checkout_payment_params[:ccv1],
        expire: checkout_payment_params[:expire_date1]
      )

      credit_card.save!
    end

    redirect_to summary_index_path(checkout_id: @checkout.id)
  end

  private

  def checkout_payment_params
    params.permit(
      :number1, :name1, :ccv1, :expire_date1, :number2, :name2, :ccv2, :expire_date2, :save_credit_card, :checkout_id
    )
  end

  def save_second_credit_card(checkout)
    return checkout if checkout_payment_params[:number2].empty?
    return checkout if checkout_payment_params[:name2].empty?
    return checkout if checkout_payment_params[:ccv2].empty?
    return checkout if checkout_payment_params[:expire_date2].empty?

    checkout.checkout_credit_cards.build(
      number: checkout_payment_params[:number2],
      name: checkout_payment_params[:name2],
      expire: checkout_payment_params[:expire_date2],
      cvc: checkout_payment_params[:ccv2]
    )

    checkout
  end
end