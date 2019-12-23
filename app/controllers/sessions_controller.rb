# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
 end
end
