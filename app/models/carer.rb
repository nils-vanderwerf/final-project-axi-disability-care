class Carer < User
    has_many :tasks, through: :bookings
end
