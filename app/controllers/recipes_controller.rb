class RecipesController < ApplicationController
  def generate 
    response = HTTP.get("https://api.spoonacular.com/recipes/complexSearch?query=#{params[:query]}&cuisine=#{params[:cuisine]}&diet=#{params[:diet]}&number=#{params[:number]}&intolerances=#{params[:allergies]}&apiKey=#{Rails.application.credentials.api_key_four}&addRecipeInformation=true&addRecipeNutrition=flase&instructionsRequired=true")
    recipes = response.parse(:json)
    render json: recipes.as_json
  end
end
