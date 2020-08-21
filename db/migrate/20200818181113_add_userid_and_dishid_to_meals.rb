class AddUseridAndDishidToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :user_id, :integer 
    add_column :meals, :dish_id, :integer
  end
end


