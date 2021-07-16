class Category < ApplicationRecord
    has_many :tasks,
    primary_key: :id,
    foreign_key: :category_id,
    class_name: :Task
end
