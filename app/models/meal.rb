class Meal < ApplicationRecord
    belongs_to :user 
    belongs_to :day

    validates_presence_of :mealtime

end
