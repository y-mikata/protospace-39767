class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters  #メソッド名は慣習（deviseの提供元では、新たに定義するメソッド名をこのように定義しているためこのメソッド名で定義することが多い）
    # deviseのUserモデルにパラメーターを許可（今回は4項目追加）
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end
