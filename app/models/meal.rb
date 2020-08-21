class Meal < ApplicationRecord
    belongs_to :user 
    belongs_to :dish, optional: true
    accepts_nested_attributes_for :dish, reject_if: :all_blank

    validates_presence_of :day_name, :meal_time

    scope :days, -> { where.not(day_name: nil) }
    scope :search, -> (term) { self.days.where("day_name LIKE ?", "%#{term}") }
    
    def display_dish
        dish.dish_name if dish
    end
    
    # def unique_day
    #  if Meal.find_by(day_name: self.day_name, meal_time: self.meal_time) 
    # end


    # def dish_attributes=(dish_attributes)
    #     self.dish = Dish.find_or_create_by(dish_name: dish_attributes[:dish_name]) unless dish_attributes[:dish_name.blank?]
    # end


end
