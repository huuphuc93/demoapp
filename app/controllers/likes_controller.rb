class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.user = current_user
      if @like.save
        redirect_to post_path(@post)
      end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to post_path(@like.post)
  end
end
