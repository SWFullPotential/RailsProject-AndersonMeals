class Dish < ApplicationRecord
    has_many :meals 
    has_many :users, through: :meals 


    scope :dish_present, -> { where.not(dish_name: nil)}
    scope :dish_search, -> (dish_term) { self.dish_present.where("dish_name LIKE ?", "%#{dish_term}%") }
end
