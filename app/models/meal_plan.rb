class MealPlan < ApplicationRecord
  has_many :meals
  belongs_to :user
end
