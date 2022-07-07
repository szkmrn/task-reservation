class UsersController < ApplicationController
  before_action :authenticate_user!
  def account
    @users= current_user
  end

  def profile
    @users= current_user
  end
end
