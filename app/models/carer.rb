class Carer < ApplicationRecord
    belongs_to :user
    has_many :tasks, through: :bookings
end
