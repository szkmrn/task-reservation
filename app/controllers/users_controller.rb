class UsersController < ApplicationController
  before_action :authenticate_user!

  
  def account
    @user= current_user
  end

  def profile
    @user= current_user
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:name,:introduction))
      flash[:notice] = "ユーザープロフィールの情報を更新しました"
      redirect_to :users_profile
    else
      render :users_profile
    end  
  end

    
  
  
  
end
