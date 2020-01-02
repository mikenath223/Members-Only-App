# frozen_string_literal: true

module SessionsHelper
  attr_writer :current_user
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find_by(id: user_id)
  end

  def logged_in?
    !current_user.nil?
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    current_user.update_attribute(:remember_token,
                                  User.digest(User.new_token))

    session[:user_id] = nil
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
    self.current_user = nil
  end
end
