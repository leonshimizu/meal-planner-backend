class CreateMealPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_plans do |t|
      t.string :diet
      t.string :allergies
      t.string :timeFrame
      t.string :calories

      t.timestamps
    end
  end
end
