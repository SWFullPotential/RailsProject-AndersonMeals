class DishesController < ApplicationController
    def index 
        @dishes = Dish.all
    end
    def new 
        @dish = Dish.new 
    end
    def create 
        
    end
    def show 
    end
    def edit 
    end
    def update 
    end
    def destroy 
    end

    private 

    def dish_params 
        params.require(:dish).permit(:dish_name)
    end
    def set_dish 
        @dish = Dish.find_by(id: params[:id])
    end
end
