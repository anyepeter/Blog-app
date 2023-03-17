class Api::PostsController < Api::ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts.includes(:comments, :likes)
    render json: @posts
  end
end