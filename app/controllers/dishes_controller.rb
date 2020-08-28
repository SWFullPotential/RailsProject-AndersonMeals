class DishesController < ApplicationController
    before_action :set_dish, only: [:show, :edit, :update, :destroy]
    before_action :set_meal, only: [:new, :create]
    helper_method :params
    def index 
        if params[:dish_term]
            @dishes = Dish.dish_search(params[:dish_term])
        elsif !params[:dish].blank?
            @dishes = Dish.where(dish_name: params[:dish_name])
        else
            @dishes = Dish.all
        end
    end
    def new 
        @dish = Dish.new 
    end
    def create 
        @dish = Dish.find_or_create_by(dish_name: dish_params[:dish_name])
            @dish.meals << @meal
        if @dish.save && @meal.save
            redirect_to meal_dishes_path(@meal)
        else
            flash[:error] = @dish.errors.full_messages
            render :new 
        end
    end
    def show 
    end
    def edit 
        unless current_user.owns_dish?(@dish)
            flash[:error] = @dish.errors.full_messages
            redirect_to meals_path
        end
    end
    def update 
        if @dish.update(dish_params)
            redirect_to dish_path(@dish)
        else 
            flash[:error] = @dish.errors.full_messages
            render :edit
        end
    end
    def destroy 
        @dish.destroy 
        flash[:notice] = "Your dish has been detroyed"
        redirect_to meals_path
    end

    private 

    def dish_params 
        params.require(:dish).permit(:dish_name, :id)
    end
    def set_dish 
        @dish = Dish.find_by(id: params[:id])
    end
    def set_meal 
        @meal = Meal.find_by_id(params[:meal_id])
    end
end
