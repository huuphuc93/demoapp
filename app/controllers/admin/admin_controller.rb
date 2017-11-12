class Admin::AdminController < Admin::BaseController

 def index
  @user = User.all.paginate(page: params[:page])
  @post = Post.all
  @comment = Comment.all
  @tag = Tag.all
 end
end
