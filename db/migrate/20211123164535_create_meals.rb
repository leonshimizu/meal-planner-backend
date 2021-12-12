class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.integer :meal_plan_id
      t.integer :user_id
      t.string :day_of_week
      t.string :meal_type

      t.timestamps
    end
  end
end
