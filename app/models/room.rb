class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :picture
    has_one_attached :image
   
end
