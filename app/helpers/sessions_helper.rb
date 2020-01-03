# frozen_string_literal: true

module SessionsHelper
  attr_writer :current_user

  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find_by(id: user_id)
  end

  def logged_in?
    !current_user.nil?
  end
end
