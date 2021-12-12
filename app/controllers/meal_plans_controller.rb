class MealPlansController < ApplicationController
  def index 
    meal_plans = MealPlan.all
    render json: meal_plans.as_json
  end

  def create
    meal_plans = MealPlan.all 
    meal_plans.delete_all # deletes all meal plans before adding the new meal plan

    meal_plan = MealPlan.new(
      diet: params[:diet],
      allergies: params[:allergies],
      timeFrame: params[:timeFrame],
      calories: params[:calories]
    )
    if meal_plan.save
      render json: meal_plan.as_json
    else
      render json: {message: meal_plan.erros.full_messages}, status: :bad_request
    end
  end

  def generate 
    response = HTTP.get("https://api.spoonacular.com/mealplanner/generate?timeFrame=week&apiKey=#{Rails.application.credentials.api_key_one}&targetCalories=#{params[:calories]}&diet=#{params[:diet]}&exlude=#{params[:allergies]}")
    meal_plan = response.parse(:json)
    week = meal_plan["week"]
    render json: week.as_json
  end
end 