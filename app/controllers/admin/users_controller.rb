class Admin::UsersController < Admin::BaseController

  def index
    @user = User.all.paginate(page: params[:page])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
end
