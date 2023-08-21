class CafePostsController < ApplicationController
  def new
    @cafe = Cafe.find(params[:cafe_id])
    @cafe_post = CafePost.new
  end

  def create
    cafe_post = CafePost.new(cafe_post_params)
    cafe_post.user_id = current_user.id
    cafe_post.save
    redirect_to cafe_posts_path
  end

  def index
    @cafe_posts = CafePost.all
  end

  def show
    @cafe_post = CafePost.find(params[:id])
  end

  def destroy
    cafe_post = CafePost.find(params[:id])
    cafe_post.destroy
    redirect_to cafe_posts_path
  end


end
