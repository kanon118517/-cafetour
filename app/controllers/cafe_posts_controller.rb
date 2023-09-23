class CafePostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def new
    @cafe = Cafe.find(params[:cafe_id])
    @cafe_post = CafePost.new
  end

  def create
    cafe_post = CafePost.new(cafe_post_params)
    cafe_post.user_id = current_user.id
    if cafe_post.save
      redirect_to cafe_posts_path
    else
      redirect_to cafe_posts_path
    end
  end

  def index
    @q = CafePost.ransack(params[:q])
    @cafe_posts = @q.result(distinct: true)
  end

  def show
    @cafe_post = CafePost.find(params[:id])
    @comments = @cafe_post.comments
    @comment = current_user.comments.new
  end

  def edit
    @cafe_post = CafePost.find(params[:id])
  end

  def update
    cafe_post = CafePost.find(params[:id])
    cafe_post.update(cafe_post_params)
    redirect_to cafe_posts_path
  end

  def destroy
    cafe_post = CafePost.find(params[:id])
    cafe_post.destroy
    redirect_to cafe_posts_path
  end

  private

  def cafe_post_params
    params.require(:cafe_post).permit(:cafe_comment, :cafe_id, :user_id, :image)
  end


end
