class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: cafe_posts_path)
    else
      redirect_back(fallback_location: cafe_posts_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :cafe_post_id)
  end

end
