class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update]

  def show
    @user = User.friendly.find params[:id]
    @posts = @user.my_all_posts
    render 'posts/index'
  end

  def edit
    @user = User.friendly.find params[:id]
  end

  def update
    @user = User.friendly.find params[:id]
    if @user.update(permit_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def permit_params
    params.require(:user).permit(:id, :username, :email, :profile_photo)
  end
end
