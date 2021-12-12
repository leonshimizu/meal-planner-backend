class MealsController < ApplicationController
  def index 
    meals = Meal.all
    render json: meals.as_json
  end

  def create
    days_of_week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    meal_types = ["breakfast", "lunch", "dinner"]

    i = 0
    7.times do 
      j = 0
      3.times do 
        meal = Meal.new(
          meal_plan_id: 1,
          user_id: 1,
          recipe_id: params[days_of_week[i]][:meals][j][:id],
          day_of_week: days_of_week[i],
          meal_type: meal_types[j]
        )
        meal.save
        j += 1
      end
      i += 1
    end

    meals = Meal.all 
    meals.each do |meal|
      meal.meal_plan_id = MealPlan.first.id
      meal.save!
    end
  end

  def generate 
    response = HTTP.get("https://api.spoonacular.com/recipes/informationBulk?ids=#{params[:meal1]},#{params[:meal2]},#{params[:meal3]}&apiKey=#{Rails.application.credentials.api_key_two}&includeNutrition=true")
    meal = response.parse(:json)
    render json: meal.as_json
  end

  def save
  end
end