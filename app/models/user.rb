class User < ApplicationRecord
    # password will be salted, wants a password and password_confirmation
    has_secure_password 

    validates_presence_of :email
    validates_uniqueness_of :email, uniqueness: { case_sensitive: false }

    belongs_to :roleable, polymorphic: true
    belongs_to :carer 
    belongs_to :participant

    # has_many :tasks,
    # primary_key: :id,
    # foreign_key: :participant_id,
    # class_name: :Task

    # has_many :tasks

    # has_many :tasks,
    # primary_key: :id,
    # foreign_key: :carer_id

    # has_many :tasks, through: :bookings, source: :carer

    # has_many :hired_carers,
    # through: :booked_tasks,
    # source: :carer

    # has_many :participants,
    # through: :hired_tasks,
    # source: :user

    # Replace with custom address attributes method 
    has_many :user_categories
    has_many :categories, :through => :user_categories

    belongs_to :address
    accepts_nested_attributes_for :categories
    accepts_nested_attributes_for :address
    
    has_many :participants
    has_one_attached :avatar


    
    # belongs_to :profileable, :polymorphic => true

    def address_attributes=(address)
        self.address = Address.find_or_create_by(
                    city: Address[:city].upcase(), 
                    state: Address[:state].upcase(),
                    zip_code: Address[:zip_code] )
    end 
end
