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

  def create 
    post = Post.new(params.require(:post).permit(:Title, :Text)
    .merge(author:current_user, CommentsCounter:0, LikesCounter:0))
    respond_to do |format|
      format.html do
        if post.save 
          flash[:success] = "Post created successfully"
          redirect_to user_posts_url
        else 
          flash.now[:error] = "Error: Post could not be saved"
          render :new, locals: { post: post }
        end
      end
    end
  end
end
