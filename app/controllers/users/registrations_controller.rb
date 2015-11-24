class Users::RegistrationsController < Devise::RegistrationsController
  # before_filter :configure_sign_up_params, only: [:create]
  # before_filter :configure_account_update_params, only: [:update]

  def show
    @user = User.find(params[:id])
  end

  protected

  def after_update_path_for(resource)
    profile_path(resource)
  end
end
