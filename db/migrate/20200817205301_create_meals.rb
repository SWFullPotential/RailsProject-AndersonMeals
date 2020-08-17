class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :meal
      t.integer :user_id
      t.integer :day_id

      t.timestamps
    end
  end
end
