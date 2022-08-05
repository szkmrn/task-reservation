class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservation = Reservation.where(user_id: @user.id)
  end

  def new 
    @reservation = Reservation.new(params_reservation)
    if @reservation.valid?
      @room = Room.find(@reservation.room_id)
      @days = (@reservation.end_date - @reservation.start_date).to_i
      @price = @room.price*@days*@reservation.person
    else
      @room = Room.find(@reservation.room_id)
      @user = User.find(@room.user_id)
      @reserv = current_user
      if user_signed_in?
        @user_check = User.exists?(id: @reserv.id,introduction: nil)
      end      
      render template:"rooms/show"
    end
  end

  def create
    @reservation = Reservation.new(params_reservation)
    if @reservation.save
      flash[:notice]="ルームの予約が完了しました"
      redirect_to reservation_path(@reservation.id)
    else 
      flash[:notice]="ルームの予約に失敗しました"
      render "new"
    end
    
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end
  
  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def params_reservation
    params.require(:reservation).permit(:user_id,:room_id,:start_date,:end_date,:person,:total_price)
  end
  
end
