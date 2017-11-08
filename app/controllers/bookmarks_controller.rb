class BookmarksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @bookmark = current_user.bookmarks.build
    @bookmark.post_id = @post.id
    if @bookmark.save
      redirect_to post_path(@post)
    else
    end
  end

  def delete
    @bookmark.destroy
    redirect_to post_path
  end
  
  def index
    @user = current_user
    @bookmark = @user.bookmarks.map(&:post_id)
  end
end
