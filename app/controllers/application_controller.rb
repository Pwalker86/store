class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ensure_open_order, if: :user_signed_in?
  protect_from_forgery with: :exception, prepend: true

  protected
  # @returns decorated [Order]
  def ensure_open_order
    @open_order = OrderDecorator.decorate(current_user.orders.find_or_create_by(status: "open"))
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
