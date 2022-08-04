class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

  validates :person, presence:true
  validate :start_date_check
  validate :start_end_check
  
  def start_date_check 
    errors.add(:start_date,"に過去の日付は指定できません") if start_date.nil? || start_date < Date.today
  end
  def start_end_check
    errors.add(:end_date,"は開始日より後の日付を指定してください") if end_date.nil? || start_date > end_date
  end  
end
