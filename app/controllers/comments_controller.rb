class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    comment = Comment.create!(params.require(:comment).permit(:text)
     .merge(author_id: @user.id, posts_id: @post.id))

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment created successfully'
          redirect_to user_post_path(@user, @post)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
          render :new, locals: { comment: comment }
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_posts_path
  end
end
