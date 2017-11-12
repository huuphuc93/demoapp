class Admin::TagsController < Admin::BaseController

 def index
  @tag = Tag.all.paginate(page: params[:page])
 end

 def destroy
  @tag = Tag.find(params[:id])
  @tag.destroy
  redirect_to admin_tags_path
 end
end
