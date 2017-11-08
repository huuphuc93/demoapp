class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    if params[:tag]
      @tag = Tag.find_by(name: params[:tag])
      @post = Post.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 5)
    else
      @post = Post.all.paginate(page: params[:page], per_page: 5)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
     @post = Post.find_by(id: params[:id])
     @comment = @post.comments.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @post.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :all_tags, :picture)
  end

  def correct_user
      @post = Post.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
  end
end
