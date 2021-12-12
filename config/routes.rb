Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users" => "users#index"
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/meal_plans" => "meal_plans#index"
  post "/meal_plans" => "meal_plans#create"
  get "/meal_plans_generate" => "meal_plans#generate"
  post "/meal_plans_save" => "meal_plans#save"

  get "/meals" => "meals#index"
  post "/meals" => "meals#create"
  get "/meals_generate" => "meals#generate"
  post "/meals_save" => "meals#save"
end
