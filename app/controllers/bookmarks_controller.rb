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

  def destroy
    @bookmark = Bookmark.find params[:id]
    @bookmark.destroy
    redirect_to post_path(@bookmark.post)
  end

  def index
    @user = current_user
    @posts = @user.bookmark_posts.paginate(page: params[:page], per_page: 10)
  end
end
