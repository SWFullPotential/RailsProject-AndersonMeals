class Meal < ApplicationRecord
    belongs_to :user 
    belongs_to :dish, optional: true
    accepts_nested_attributes_for :dish, reject_if: :all_blank

    validates_presence_of :day_name, :meal_time

    # scope :dish_set, -> { where.not(dish_id: nil) }
    # scope :my_dishes, -> { self.dish_set.where(user_id == current_user.id) }

    # def self.dish_set
    #     where.not(dish_id: nil)
    # end

    # def self.my_dishes
    #     self.dish_set.where(self.user_id == current_user.id)
    # end
    scope :days, -> { where.not(day_name: nil) }
    scope :search, -> (term) { self.days.where("day_name LIKE ?", "%#{term}") }

    # scope :published, -> { where.not(published_date: nil) }
    # # scope :not_published, -> { where(published_date: nil) }
    # scope :recent_published_blogs, -> { self.published.where("published_date > ?", 5.days.ago) }
    # scope :sorted_published_blogs, -> { self.published.order(published_date: :desc)}
    # scope :sorted_non_published_blogs, -> { self.non_published.order(published_date: :desc)}
    # scope :search, -> (term) { self.sorted_published_blogs.where("title LIKE ?", "%#{term}%") }



        # def unique_day
        #  if Meal.find_by(day_name: self.day_name, meal_time: self.meal_time) 
        # end


        # def dish_attributes=(dish_attributes)
        #     self.dish = Dish.find_or_create_by(dish_name: dish_attributes[:dish_name]) unless dish_attributes[:dish_name.blank?]
        # end

        def display_dish
            dish.dish_name if dish
        end
        

end
