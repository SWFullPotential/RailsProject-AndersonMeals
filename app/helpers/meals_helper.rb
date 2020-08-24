module MealsHelper

    def add_edit_dish(meal)
        if meal.dish 
            content_tag :td do 
                link_to meal.dish.dish_name, edit_meal_path(meal.id)
            end
        else
            content_tag :td do 
                link_to "Add Dish", new_meal_dish_path(meal)
            end 
        end
    end

end
