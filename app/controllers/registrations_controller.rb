class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :shipping_address, :shipping_suburb, :shipping_zip, :shipping_state,
      :billing_address, :billing_suburb, :billing_zip, :billing_state, 
      :phone, :admin, :image, :email, :password, :password_confirmation,
      :credit_card_number, :credit_card_name, :credit_card_expire_date, :credit_card_ccv)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :shipping_address, :shipping_suburb, :shipping_zip, :shipping_state,
      :billing_address, :billing_suburb, :billing_zip, :billing_state,
      :phone, :admin, :image, :email, :password, :password_confirmation, :current_password,
      :credit_card_number, :credit_card_name, :credit_card_expire_date, :credit_card_ccv)
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