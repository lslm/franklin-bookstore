# frozen_string_literal: true

class CreditCardsController < ApplicationController
  def new
    @credit_card = current_user.credit_cards.build
  end

  def create
    @credit_card = current_user.credit_cards.build(credit_card_params)

    respond_to do |format|
      if @credit_card.save
        format.html { redirect_to edit_user_registration_path, notice: 'Cartão de crédito salvo com sucesso' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @credit_card = current_user.credit_cards.find(params[:id])
  end

  def update
    @credit_card = current_user.credit_cards.find(params[:id])

    if @credit_card.update(credit_card_params)
      redirect_to edit_user_registration_path, notice: 'Dados de cartão de crédito atualizados'
    else
      render action: 'edit'
    end
  end

  def destroy
    credit_card = current_user.credit_cards.find(params[:id])
    credit_card.destroy!
    redirect_to edit_user_registration_path, notice: 'Cartão apagado'
  end

  private

  def credit_card_params
    params.require(:credit_card).permit(
      :name, :number, :expire, :cvc
    )
  end
end
