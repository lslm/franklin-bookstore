class AddressesController < ApplicationController
  def new
    @address = current_user.addresses.build
  end

  def create
    @address = current_user.addresses.build(address_params)

    if @address.save
      redirect_to edit_user_registration_path, notice: 'Endereço salvo com sucesso', anchor: 'addresses'
    else
      render action: 'new'
    end
  end

  def edit
    @address = current_user.addresses.find(params[:id])
  end

  def update
    @address = current_user.addresses.find(params[:id])

    if @address.update(address_params)
      redirect_to edit_user_registration_path, notice: 'Dados de endereço atualizados', anchor: 'addresses'
    else
      render action: 'edit'
    end
  end

  def destroy
    address = current_user.addresses.find(params[:id])
    address.destroy!
    redirect_to edit_user_registration_path, notice: 'Endereco apagado', anchor: 'addresses'
  end

  private

  def address_params
    params.require(:address).permit(
      :name, :street, :number, :zip_code, :city, :state, :address_type
    )
  end
end
