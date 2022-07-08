class UsersController < ApplicationController
  before_action :authenticate_user!

  
  def account
    @user= current_user
  end

  def profile
    @user= current_user
  end
  
  def update
    if @user.update
      redirect_to :users_profile
    else
      render :users_profile
    end  
  end

    
  
  
  
end
