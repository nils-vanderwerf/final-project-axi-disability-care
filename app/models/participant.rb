class Participant < ApplicationRecord
    has_one :users, :as => :roleable, dependent: :destroy
    has_many :tasks
    accepts_nested_attributes_for :user
end
