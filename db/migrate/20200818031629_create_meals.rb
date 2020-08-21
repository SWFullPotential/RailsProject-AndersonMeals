class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :day_name
      t.string :meal_time

      t.timestamps
    end
  end
end
