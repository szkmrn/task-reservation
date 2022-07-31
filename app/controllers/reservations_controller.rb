class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservation = Reservation.where(user_id: @user.id)
  end

  def new
    if @reservation = Reservation.new(params.permit(:start_date,:end_date,:person,:user_id,:room_id)).valid?
    @reservation = Reservation.new(params.permit(:start_date,:end_date,:person,:user_id,:room_id))
    @room = Room.find(@reservation.room_id)
    @days = (@reservation.end_date - @reservation.start_date).to_i
    @price = @room.price*@days*@reservation.person
    else
      redirect_to room_path(params[:room_id])
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
