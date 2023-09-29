class Admin::CafePostsController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @cafe_posts = @user.cafe_posts
    @cafe_post = @cafe_posts.find(params[:id])
  end
  
  
end
