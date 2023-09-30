class Admin::CommentsController < ApplicationController


  def destroy
    Comment.find_by(id: params[:id],cafe_post_id: params[:cafe_post_id]).destroy
    redirect_to admin_users_path
  end


   private
  def comment_params
    params.require(:comment).permit(:comment_content, :cafe_post_id)
  end

end
