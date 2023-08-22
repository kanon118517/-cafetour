class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :post_params, only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, post_id: @cafe_post.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: @cafe_post.id)
    like.destroy
  end

  private

  def post_params
    @cafe_post = CafePost.find(params[:cafe_post_id])
  end

end
