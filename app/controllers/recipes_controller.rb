class RecipesController < ApplicationController
  def generate 
    response = HTTP.get("https://api.spoonacular.com/food/products/search?query=#{params[:query]}&cuisine=#{params[:cuisine]}&diet=#{params[:diet]}&intolerances=#{params[:allergies]}&number=#{params[:number]}&apiKey=#{Rails.application.credentials.api_key_four}")
    recipes = response.parse(:json)
    render json: recipes.as_json
  end
end
