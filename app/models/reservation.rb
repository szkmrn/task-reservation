class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

  validate :start_date_check
  
  def start_date_check 
    errors.add(:start_date,"開始日に過去の日付は指定できません") if start_date.nil? || start_date < Date.today
  end
end
