class MealsController < ApplicationController
    before_action :set_meal, only: [:show, :edit, :update]

    def index 
        @meals = Meal.all
    end
    def new 
        @meal = Meal.new 
    end
    def create 
    # binding.pry
        
        @meal = current_user.meals.build(meal_params)

        if @meal.save 
            redirect_to meals_path(@meals)
        else
            render :new 
        end
    end
    def show
        
    end
    def edit 
    end
    def update
        @meal.update(meal_params)
        redirect_to meal_path(@meal)
    end
    def destroy 
    end

    private 
    def meal_params
        params.require(:meal).permit(:day_name, :meal_time, :user_id, :dish_id, dish_attributes:[:dish_name])
    end

    def set_meal 
        @meal = Meal.find_by(id: params[:id])
    end
end
