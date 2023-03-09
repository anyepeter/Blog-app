class PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
