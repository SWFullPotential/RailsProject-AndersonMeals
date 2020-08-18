class Meal < ApplicationRecord
    belongs_to :user 
    belongs_to :dish
    accepts_nested_attributes_for :dish 

    validates_presence_of :day_name, :meal_time

    def dish_attributes=(dish_attributes)
        self.dish = Dish.find_or_create_by(dish_name: dish_attributes[:dish_name]) unless dish_attributes[:dish_name.blank?]
    end

end
