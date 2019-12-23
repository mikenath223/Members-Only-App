# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @session = User.new
  end
end
