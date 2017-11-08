class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.user = current_user
      if @like.save
        redirect_to post_path(@post)
      else
      end
  end

  def destroy
  end
end
