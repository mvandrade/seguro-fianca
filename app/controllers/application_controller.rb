class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  # Pundit
  include Pundit
 
  # Gerencia erros do Pundir
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource, if: :devise_controller?

  private

  def layout_by_resource
    if :resource_name == :admin
      "location_devise"
    else
      "application"
    end
  end

  def user_not_authorized
    flash[:alert] = "Usuário não autorizado."
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    if :resource_name == :admin
        devise_parameter_sanitizer.permit(:sign_up) do |additional_attrs|
          additional_attrs.permit(:email, :password, :password_confirmation, :name )
        end
    else
        devise_parameter_sanitizer.permit(:sign_up) do |additional_attrs|
          additional_attrs.permit(:email, :password, :password_confirmation, :name )
        end
    end
  end

end