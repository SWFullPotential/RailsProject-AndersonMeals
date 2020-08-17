class Day < ApplicationRecord
    has_many :meals 
    has_many :users, through: :meals
end
