class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  validates :introduction, length: { maximum: 200 } 

  has_one_attached :image
  has_many :rooms
  has_many :reservations
  
  
  validates :introduction, presence: true if :user_signed_in?
  validates :image, presence: true if :user_signed_in?
  

end
