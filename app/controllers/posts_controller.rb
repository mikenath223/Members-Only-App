class PostsController < ApplicationController
    before_action :logged_in_user?, only: %i[new, create, index]

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.user_id = session[:user_id]
      if @post.save
        flash[:success] = "Post created successfully"
        redirect_to root_path
      else
        render 'new'
      end
    end

    def index
      @posts = Post.all
      @signed_in = current_user.present?
    end

    
    def logged_in_user?
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    private
    
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
