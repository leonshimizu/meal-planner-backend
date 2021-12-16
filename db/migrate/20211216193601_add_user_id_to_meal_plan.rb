class AddUserIdToMealPlan < ActiveRecord::Migration[6.1]
  def change
    add_column :meal_plans, :user_id, :integer
  end
end
