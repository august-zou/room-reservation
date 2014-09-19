class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logined?, :is_admin?, :current_user

  def current_user
    @current_user ||= login_from_session unless defined?(@current_user)
    @current_user
  end

  def current_community
    current_user.last_operate_community ? current_user.last_operate_community : current_user.operate_communities.first
  end

  def logined?
    !current_user.nil?
  end

  def is_admin?
    logined? && current_user.is_admin
  end

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def login_from_session
    if session[:user_id].present?
      begin
        User.find session[:user_id]
      rescue
        session[:user_id] = nil
      end
    end
  end

end
