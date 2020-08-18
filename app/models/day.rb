class Day < ApplicationRecord
    has_many :meals 
    has_many :users, through: :meals

    validates_presence_of :mealname 
end
