# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
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
