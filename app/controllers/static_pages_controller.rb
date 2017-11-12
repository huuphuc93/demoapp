class StaticPagesController < ApplicationController
  def home
    # if current_user.admin? redirect_to admin_root_path
    # redirect_to root_path
    @users = User.all
    @posts = Post.all
    @comments = Comment.all
    if logged_in?
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
