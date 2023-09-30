class Admin::CafePostsController < ApplicationController

  def show

    @cafe_post = CafePost.find(params[:id])
    @comments = @cafe_post.comments
  end


end
