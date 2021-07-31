class Carer < ApplicationRecord
    has_many :tasks, through: :bookings
    has_one :user, :as => :roleable, dependent: :destroy
    accepts_nested_attributes_for :user
end
