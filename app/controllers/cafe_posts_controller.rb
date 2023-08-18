class CafePostsController < ApplicationController
  def new
    @cafe_post = CafePost.new
  end

  def create
    @cafe_post = CafePost.new
    @cafe_post.save
    redirect_to cafe_posts_path
  end

  def index
    @cafe_posts = CafePost.all
  end

  def show
  end

  def edit
  end

  private

  def cafe_post_params
    params.require(:cafe_post).permit(:cafe_comment)
  end
end
