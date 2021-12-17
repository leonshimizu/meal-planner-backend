Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/current_user" => "users#show"

  post "/sessions" => "sessions#create"

  get "/meal_plans" => "meal_plans#index"
  post "/meal_plans" => "meal_plans#create"
  get "/meal_plans_generate" => "meal_plans#generate"

  get "/meals" => "meals#index"
  post "/meals" => "meals#create"
  get "/meals_generate" => "meals#generate"
  get "/all_meals" => "meals#show_all"
  get "/extra_info" => "meals#extra"
end
