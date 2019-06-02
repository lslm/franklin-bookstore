class RegistrationsController < Devise::RegistrationsController
  def edit
    @credit_cards = current_user.credit_cards.all
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, 
      :phone, :admin, :image, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :shipping_address,
      :phone, :admin, :image, :email, :password, :password_confirmation, :current_password,
      :credit_card_number, :credit_card_name, :credit_card_expire_date, :credit_card_ccv,
      addresses_attributes: [
        :id, :street, :number, :zip_code, :city, :state, :address_type
      ])
  end

  protected

  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params["password"]&.present?

    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end