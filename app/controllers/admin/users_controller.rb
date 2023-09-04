class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @cafe_posts = @user.cafe_posts
  end

  def edit
  end
end
