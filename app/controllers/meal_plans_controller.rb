class MealPlansController < ApplicationController
  def index 
    meal_plans = MealPlan.where(user_id: current_user.id)
    render json: meal_plans.as_json
  end

  def create
    # need to change this so it's the current user's meal plan - potentially might have to add a user_id to the meal plan table

    meal_plans = MealPlan.where(user_id: current_user.id)
    meal_plans.delete_all # deletes all meal plans before adding the new meal plan
    
    meal_plan = MealPlan.new(
      diet: params[:diet],
      allergies: params[:allergies],
      timeFrame: params[:timeFrame],
      calories: params[:calories],
      user_id: 2 # need to make dynamic based on which user is signed in
    )
    if meal_plan.save
      render json: meal_plan.as_json
    else
      render json: {message: meal_plan.erros.full_messages}, status: :bad_request
    end
  end

  def generate 
    response = HTTP.get("https://api.spoonacular.com/mealplanner/generate?timeFrame=week&apiKey=#{Rails.application.credentials.api_key_six}&targetCalories=#{params[:calories]}&diet=#{params[:diet].gsub(/\s+/, "")}&exlude=#{params[:allergies].gsub(/\s+/, "")}")
    meal_plan = response.parse(:json)
    week = meal_plan["week"]
    render json: week.as_json
  end
end 