class MealsController < ApplicationController
  def index 
    meals = Meal.all
    render json: meals.as_json
  end

  def create
    meal = Meal.new(
      meal_plan_id: params[:meal_plan_id],
      user_id: params[:user_id],
      recipe_id: params[:recipe_id],
      day_of_week: params[:day_of_week],
      meal_type: params[:meal_type]
    )
    if meal.save
      render json: meal.as_json
    else
      render json: {message: meal.erros.full_messages}, status: :bad_request
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