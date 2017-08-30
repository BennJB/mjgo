class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # protect_from_forgery with: :exception
  
  # 페북으로 로그인한 사용자의 닉네임을 변경하기 위해서 update 메소드 재설정!
  def update_resource(resource, params)
    resource.update_with_password(params)
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nic_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nic_name])
  end
  
  #-----------------이 아래꺼가 로그인 안하고, 글쓰기나 댓글 누르면 메인으로 이동하게 하는건데
  #-----------------이걸 하면, 비밀번호변경할 때, [/edit] 경로 오류가 생겨서 지웠다.
  # protected
  # def authenticate_user!
    # redirect_to '/' unless user_signed_in?
  # end
end
