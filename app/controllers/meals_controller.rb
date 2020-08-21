class MealsController < ApplicationController
    before_action :set_meal, only: [:show, :edit, :update, :destroy]

    def index 
        if params[:term]
            @meals = Meal.search(params[:term])
        else
            @meals = Meal.all
        end
    end
    def new 
        @meal = Meal.new 
        @dish = @meal.build_dish
    end
    def create 
    # binding.pry
        @meal = current_user.meals.build(meal_params)

        if @meal.save 
            
            redirect_to meals_path(@meals)
        else
            flash[:error] = @meal.errors.full_messages
            render :new 
        end
    end
    def show
        
    end
    def edit 
    end
    def update
        if @meal.update(meal_params)
        redirect_to meal_path(@meal)
          
        else 
            flash[:error] = @meal.errors.full_messages
            render :edit
        end
    end
    def destroy 
        # @meal.dish.destroy
        @meal.destroy
        flash[:notice] = "Your meal has been destroyed"
        redirect_to meals_path

    end

    private 
    def meal_params
        params.require(:meal).permit(:day_name, :meal_time, :user_id, :dish_id, dish_attributes:[:dish_name])
    end

    def set_meal 
        @meal = Meal.find_by(id: params[:id])
    end
end
