module SessionsHelper
  def log_in(user)
    remember_token = User.new_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end
  attr_writer :current_user
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find_by(id: user_id)
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    current_user.update_attribute(:remember_token,
      User.digest(User.new_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
end
