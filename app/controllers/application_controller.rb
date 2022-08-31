class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  #サインイン後、ユーザー詳細ページへ移動するよってこと
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  #サインアウト後、アバウトページへ移動するよってこと 追記・rootに変更
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])#nameからemailへ
  end
end
