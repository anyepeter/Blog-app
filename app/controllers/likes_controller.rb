class LikesController < ApplicationController
 
    def create 
        @user = current_user
        @post = Post.find(params[:post_id])
        @like = Like.new(author_id: @user.id, posts_id: @post.id)

        respond_to do |format|
            format.html do
                if @like.save
                flash[:success] = "Like save successfully"
                redirect_back_or_to "./user/#{@user.id}/posts/#{@post.id}"
              else 
                flash.now[:error] = "Error: Comment could not be saved"
              end
            end
        end
    end

end
