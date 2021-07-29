class Task < ApplicationRecord
    has_one :carer, class_name: 'User' -> { where role: 'carer' }
    has_one :participant, class_name: "User", -> {where role: 'participant'}
    # belongs_to :participant,
    #     primary_key: :id,
    #     foreign_key: :participant_id,
    #     class_name: :User,
    #     optional: true

    # belongs_to :carer,
    #     primary_key: :id,
    #     foreign_key: :carer_id,
    #     class_name: :User,
    #     optional: true

    # belongs_to :category,
    #     primary_key: :id,
    #     foreign_key: :category_id,
    #     class_name: :Category,
    #     optional: true
end
