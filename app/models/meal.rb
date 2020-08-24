class Meal < ApplicationRecord
    belongs_to :user 
    belongs_to :dish, optional: true 
    accepts_nested_attributes_for :dish, reject_if: :all_blank

    validates_presence_of :day_name, :meal_time
    validate :unique_day

    scope :days, -> { where.not(day_name: nil) }
    scope :search, -> (term) { self.days.where("day_name LIKE ?", "%#{term}") }

    def unique_day
      meal = Meal.find_by(day_name: self.day_name, meal_time: self.meal_time)
     if meal && meal.id != self.id
      self.errors.add(:same_day_time, "Day/Time already taken.")
     end
    end
 
    def display_dish
      dish.dish_name if dish
    end
end
