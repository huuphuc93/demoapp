class Admin::PostsController < Admin::BaseController

 def index
  @post = Post.all.paginate(page: params[:page])
 end

 def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to admin_posts_path
 end
end
