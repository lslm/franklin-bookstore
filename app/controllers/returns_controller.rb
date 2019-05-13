class ReturnsController < ApplicationController
  def index
    @returns = current_user.returns.all
  end

  def show
    @return_request = current_user.returns.find(params[:id])
  end

  def new
    @return = Return.new

    @item = Item.find(params[:item_id])
    @quantity_available = params[:quantity]
  end

  def create
    @return = Return.new(return_params)

    @return.user = current_user
    @return.item_id = return_params[:item_id]
    @return.status = 'pending'

    respond_to do |format|
      if @return.save
        format.html { redirect_to @return, notice: 'Sua solicitação de devolução foi feita com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def return_params
    params.require(:return).permit(:return_reason, :item_id, :quantity)
  end
end