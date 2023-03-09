class PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end 
  end
end
