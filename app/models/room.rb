class Room < ApplicationRecord
    belongs_to :user,dependent: destroy
end
