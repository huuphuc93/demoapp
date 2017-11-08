class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @posts = Post.all
    @comments = Comment.all
    if logged_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
    end
  end
end
