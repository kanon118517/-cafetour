class Admin::CommentsController < ApplicationController
  
  
  def destroy
    
  end
  
  
   private
  def comment_params
    params.require(:comment).permit(:comment_content, :cafe_post_id)
  end
  
end
