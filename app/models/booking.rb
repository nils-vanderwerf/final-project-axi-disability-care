class Booking < ApplicationRecord
    belongs_to :participant, class_name: "User",  -> {where role: 'participant'}
    belongs_to :carer, class_name: "User",  -> {where role: 'carer'}
end
