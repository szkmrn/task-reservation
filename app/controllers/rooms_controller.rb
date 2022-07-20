class RoomsController < ApplicationController
  
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルームの新規登録が完了しました"
      redirect_to room_path(@room.id)
    else
      render "new"
    end
  end

  def posts
    @user = current_user
    @room = Room.where(user_id:@user.id) 
  end
  
  def show
    @room = Room.find(params[:id])
    @user = current_user
  end

  


  def edit
  end

  def update
  end


  def rooms_params
    params.require(:room).permit(:user_id,:name,:information,:price,:address,:picture)
  end
end
