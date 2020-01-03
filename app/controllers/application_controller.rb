# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def remember(user)
    user.update_attribute(:remember_token,
                          Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64))
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    session[:user_id] = nil
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
  end
end
