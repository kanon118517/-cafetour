class UsersController < ApplicationController
  
  before_action :set_user, only: [:likes]
  

  
  def show
    @user = User.find(params[:id])
    @cafe_posts = @user.cafe_posts
  end

  def edit
    @user = current_user
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def likes
    likes = Like.where(user_id: @user.id).pluck(:cafe_post_id)
    @like_posts = CafePost.find(likes)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def reject_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  

end
