class Meal < ApplicationRecord
  belongs_to :meal_plan, optional: true 
  belongs_to :user
end
