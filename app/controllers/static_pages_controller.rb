class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @posts = Post.all
    @hot = Post.find(Like.hot.map(&:post_id))
    @comments = Comment.all
    if logged_in?
      redirect_to admin_root_path if current_user.admin?
      @post  = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
    end
  end

  def search
    content = params[:search]
    @post = Post.search(content).paginate(page: params[:page])
    # byebug
  end
end
