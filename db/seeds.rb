MealPlan.create!([
  {diet: "Gluten Free", allergies: nil, timeFrame: "week", calories: "1200"},
  {diet: "test diet", allergies: "test allergies", timeFrame: "test time frame", calories: "test calories"}
])
Meal.create!([
  {meal_plan_id: 1, user_id: 1, recipe_id: 283592, day_of_week: "friday", meal_type: "breakfast"},
  {meal_plan_id: 1, user_id: 1, recipe_id: 167221, day_of_week: "friday", meal_type: "lunch"},
  {meal_plan_id: 1, user_id: 1, recipe_id: 642681, day_of_week: "friday", meal_type: "dinner"},
  {meal_plan_id: 1, user_id: 1, recipe_id: 1, day_of_week: "test day of week", meal_type: "test meal type"}
])
User.create!([
  {name: "Stassie", email: "stassie@gmail.com", password_digest: "password"}
])
