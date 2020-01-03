# frozen_string_literal: true

module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def current_user=(user)
    @current_user = user
  end

  def logged_in?
    !current_user.nil?
  end
end
