class DislikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @dislike = @post.dislikes.build
    @dislike.user = current_user
      if @dislike.save
        redirect_to post_path(@post)
      end
  end
  
  def destroy
    @dislike = Dislike.find(params[:id])
    @dislike.destroy
    redirect_to post_path(@dislike.post)
  end
end
