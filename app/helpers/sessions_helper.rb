module SessionsHelper
  def log_in(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
      @current_user ||= User.find_by(remember_digest: User.digest(cookies[:remember_token]))
  end

  def current_user=(user)
    @current_user = user
  end

  def logged_in?
    !current_user.nil?
  end

  def sign_out
    @current_user = nil
    cookies[:remember_token] = nil
    session[:user_id] = nil
  end
  
end
