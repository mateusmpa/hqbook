class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :city, :country, :email, :password,
               :password_confirmation, :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :city, :country, :email, :birth_date, :gender, :avatar,
               :current_password, :password, :password_confirmation,
               :remember_me)
    end
  end

  protect_from_forgery with: :exception
end
