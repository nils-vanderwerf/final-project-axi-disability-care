class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    validates :name, :email, presence: true
    validates :email, uniqueness: true

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

    # belongs_to :address
    # Replace with custom address attributes method accepts_nested_attributes_for :address

    has_one_attached :avatar

    has_many :user_categories
    has_many :categories, :through => :user_categories
    
    accepts_nested_attributes_for :categories

    def add_attributes=(address)
        self.address = Address.find_or_create_by(
                    city: address[:city].upcase(), 
                    state: address[:state].upcase(),
                    zip_code: address[:zip_code] )
    end 
end
