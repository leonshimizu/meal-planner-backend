class AddRecipeId < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :recipe_id, :integer
  end
end
