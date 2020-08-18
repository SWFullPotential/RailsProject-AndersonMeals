class Meal < ApplicationRecord
    belongs_to :user 
    belongs_to :meal

    validates_presence_of :day_name, :meal_time
    validates_uniqueness_of [:day_name && :meal_time]
end
