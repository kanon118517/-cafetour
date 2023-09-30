class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @cafe_posts = @user.cafe_posts
  end

 
end
