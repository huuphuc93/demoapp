class Admin::BaseController < ApplicationController
  before_action :logged_in_user
  before_action :find_admin

  private
  def find_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end
end
