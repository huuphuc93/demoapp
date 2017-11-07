class DislikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @dislike = @post.dislikes.build
    @dislike.user = current_user
      if @dislike.save
        redirect_to post_path(@post)
      else
      end
  end
end
