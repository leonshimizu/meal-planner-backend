class MealsController < ApplicationController
  def index 
    meals = Meal.all
    render json: meals.as_json
  end

  def create
    # meal = Meal.new(
    #   meal_plan_id: params[:meal_plan_id],
    #   user_id: params[:user_id],
    #   recipe_id: params[:recipe_id],
    #   day_of_week: params[:day_of_week],
    #   meal_type: params[:meal_type]
    # )
    # if meal.save
    #   render json: meal.as_json
    # else
    #   render json: {message: meal.erros.full_messages}, status: :bad_request
    # end

    a = 0
    3.times do 
      meal = Meal.new(
        meal_plan_id: 1,
        user_id: 1,
        recipe_id: params[:monday][:meals][a][:id],
        day_of_week: "monday",
        meal_type: "test meal type"
      )
      meal.save
      a += 1
    end
    
    b = 0
    3.times do 
      meal = Meal.new(
        meal_plan_id: 1,
        user_id: 1,
        recipe_id: params[:tuesday][:meals][b][:id],
        day_of_week: "test day of week",
        meal_type: "tuesday"
      )
      meal.save
      b += 1
    end

    c = 0
    3.times do 
      meal = Meal.new(
        meal_plan_id: 1,
        user_id: 1,
        recipe_id: params[:wednesday][:meals][c][:id],
        day_of_week: "test day of week",
        meal_type: "wednesday"
      )
      meal.save
      c += 1
    end

    d = 0
    3.times do 
      meal = Meal.new(
        meal_plan_id: 1,
        user_id: 1,
        recipe_id: params[:thursday][:meals][d][:id],
        day_of_week: "test day of week",
        meal_type: "thursday"
      )
      meal.save
      d += 1
    end

    e = 0
    3.times do 
      meal = Meal.new(
        meal_plan_id: 1,
        user_id: 1,
        recipe_id: params[:friday][:meals][e][:id],
        day_of_week: "test day of week",
        meal_type: "friday"
      )
      meal.save
      e += 1
    end

    f = 0
    3.times do 
      meal = Meal.new(
        meal_plan_id: 1,
        user_id: 1,
        recipe_id: params[:saturday][:meals][f][:id],
        day_of_week: "test day of week",
        meal_type: "saturday"
      )
      meal.save
      f += 1
    end

    g = 0
    3.times do 
      meal = Meal.new(
        meal_plan_id: 1,
        user_id: 1,
        recipe_id: params[:sunday][:meals][g][:id],
        day_of_week: "test day of week",
        meal_type: "sunday"
      )
      meal.save
      g += 1
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