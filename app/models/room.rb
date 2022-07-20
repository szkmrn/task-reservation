class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :picture
    
   
    validates :name,presence:true
    validates :information,presence:true
    validates :price,presence:true,numericality:true
    validates :address,presence:true
    validates :picture,presence:true
end
