class UsersController < ApplicationController
  protect_from_forgery

  load_and_authorize_resource

  def show; end

  def update
    @user.update_attributes(update_params)
    respond_to :js
  end

  private

  def update_params
    params.require(:user).permit(%i[height weight])
  end
end
