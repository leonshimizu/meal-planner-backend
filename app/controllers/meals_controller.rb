class MealsController < ApplicationController
  def index 
    meals = Meal.where(user_id: current_user.id)
    render json: meals.as_json
  end

  def create
    meals = Meal.where(user_id: current_user.id)
    meals.delete_all 

    days_of_week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    meal_types = ["breakfast", "lunch", "dinner"]

    i = 0
    7.times do 
      j = 0
      3.times do 
        meal = Meal.new(
          meal_plan_id: 1,
          user_id: current_user.id,
          recipe_id: params[days_of_week[i]][:meals][j][:id],
          day_of_week: days_of_week[i],
          meal_type: meal_types[j]
        )
        meal.save
        j += 1
      end
      i += 1
    end

    meals = Meal.where(user_id: current_user.id)
    meals.each do |meal|
      meal.meal_plan_id = MealPlan.where(user_id: current_user.id)[0].id
      meal.save!
    end
  end

  def generate 
    response = HTTP.get("https://api.spoonacular.com/recipes/informationBulk?ids=#{params[:meal1]},#{params[:meal2]},#{params[:meal3]}&apiKey=#{Rails.application.credentials.api_key_seven}&includeNutrition=true")
    meal = response.parse(:json)
    render json: meal.as_json
  end

  def show_all 
    meals = Meal.where(user_id: current_user.id)
    all_meals = []

    meals.each do |meal|
      response = HTTP.get("https://api.spoonacular.com/recipes/informationBulk?ids=#{meal.recipe_id}&apiKey=#{Rails.application.credentials.api_key_two}&includeNutrition=true")
      meal_info = response.parse(:json)
      all_meals << meal_info[0]
    end
    render json: all_meals.as_json

    # code to test Personal Meal Plan Page with one request instead of 20
    # meal = Meal.first  
    # response = HTTP.get("https://api.spoonacular.com/recipes/informationBulk?ids=#{meal.recipe_id}&apiKey=#{Rails.application.credentials.api_key_six}&includeNutrition=true")
    # meal_info = response.parse(:json)
    # render json: meal_info.as_json
  end

  def extra 
    response = HTTP.get("https://api.spoonacular.com/recipes/informationBulk?ids=#{params[:meal_id]}&apiKey=#{Rails.application.credentials.api_key_six}&includeNutrition=true")
    meal_info = response.parse(:json)
    render json: meal_info.as_json
  end
end