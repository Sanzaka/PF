class ApplicationController < ActionController::Base

  # デバイス機能利用時、ストロングパラメータ参照
  before_action :configure_permitted_parameters, if: :devise_controller?

  # devise機能利用後の遷移先一覧
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :image])
  end
end
