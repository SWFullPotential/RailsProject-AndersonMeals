class DishesController < ApplicationController
    before_action :set_dish, only: [:show, :edit, :update, :destroy]
    def index 
        @dishes = Dish.all
    end
    def new 
    # binding.pry
        @meal = Meal.find_by_id(params[:meal_id])
        @dish = Dish.new 
    end
    def create 
        unless dish_params[dish_name: ""]
            @meal = Meal.find_by_id(params[:meal_id])
            # @dish = @meal.build_dish(dish_params)
            @dish = Dish.find_or_create_by(dish_name: dish_params[:dish_name])
                @dish.meals << @meal

            # binding.pry

            if @dish.save && @meal.save
                # binding.pry
                redirect_to meal_dishes_path(@meal)
            else
                flash[:error] = @dish.errors.full_messages
                render :new 
            end
        else
            @meal = Meal.find_by_id(params[:meal_id])
                if @meal.save 
                    redirect_to meal_dishes_path(@meal)
                else 
                    flash[:error] = @dish.errors.full_messages
                render :new 
                end
        end
    end
    def show 
        @meal = Meal.find_by(dish_id:params[:dish_id])

    end
    def edit 
        # binding.pry
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
        # @meals = @dish.meals
        @dish.destroy 
        flash[:notice] = "Your dish has been detroyed"

        # binding.pry
        redirect_to meals_path
    end

    private 

    def dish_params 
        params.require(:dish).permit(:dish_name)
    end
    def set_dish 
        @dish = Dish.find_by(id: params[:id])
    end
end
