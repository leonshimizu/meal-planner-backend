class MealPlansController < ApplicationController
  def index 
    meal_plans = MealPlan.where(user_id: current_user.id)
    render json: meal_plans.as_json
  end

  def create
    meal_plans = MealPlan.where(user_id: current_user.id)
    meal_plans.delete_all 
    
    meal_plan = MealPlan.new(
      diet: params[:diet],
      allergies: params[:allergies],
      timeFrame: params[:timeFrame],
      calories: params[:calories],
      user_id: current_user.id
    )
    if meal_plan.save
      render json: meal_plan.as_json
    else
      render json: {message: meal_plan.erros.full_messages}, status: :bad_request
    end
  end

  def generate 
    response = HTTP.get("https://api.spoonacular.com/mealplanner/generate?timeFrame=week&apiKey=#{Rails.application.credentials.api_key_four}&targetCalories=#{params[:calories]}&diet=#{params[:diet].gsub(/\s+/, "")}&exlude=#{params[:allergies].gsub(/\s+/, "")}")
    meal_plan = response.parse(:json)
    week = meal_plan["week"]
    
    images = []

    week.each do |day|
      day[1]["meals"].each do |meal|
        response = HTTP.get("https://api.spoonacular.com/recipes/informationBulk?ids=#{meal["id"]}&apiKey=#{Rails.application.credentials.api_key_seven}&includeNutrition=true")
        recipe_info = response.parse(:json)
        images << recipe_info[0]["image"]
      end
    end

    week["image_urls"] = images

    render json: week.as_json
  end
end 