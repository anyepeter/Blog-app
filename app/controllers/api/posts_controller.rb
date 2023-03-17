class Api::PostsController < Api::ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts.includes(:comments, :likes)
    render json: @posts
  end

  def create
    post = Post.new(params.require(:post).permit(:Title, :Text)
    .merge(author: current_user, CommentsCounter: 0, LikesCounter: 0))
        if post.save
      render json: post, status: :created
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: post }
        end
      end
    end
  end
end
