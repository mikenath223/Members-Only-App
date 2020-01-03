# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user?, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def logged_in_user?
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
