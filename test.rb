require 'http'

response = HTTP.get("https://api.spoonacular.com/recipes/informationBulk?ids=308704&apiKey=#{APIKEY}&includeNutrition=true")
meal_info = response.parse(:json)

# pp meal_info[0]["title"]
# pp meal_info[0]["image"]
# pp meal_info[0]["instructions"]
# pp meal_info[0]["preparationMinutes"]
# pp meal_info[0]["cookingMinutes"]
# pp meal_info[0]["pricePerServing"]
# pp meal_info[0]["servings"]

# calories
pp meal_info[0]["nutrition"]["nutrients"][0]["title"]
pp meal_info[0]["nutrition"]["nutrients"][0]["amount"]
pp meal_info[0]["nutrition"]["nutrients"][0]["unit"]
# fat
pp meal_info[0]["nutrition"]["nutrients"][1]["title"]
pp meal_info[0]["nutrition"]["nutrients"][1]["amount"]
pp meal_info[0]["nutrition"]["nutrients"][1]["unit"]
# carbohydrates
pp meal_info[0]["nutrition"]["nutrients"][3]["title"]
pp meal_info[0]["nutrition"]["nutrients"][3]["amount"]
pp meal_info[0]["nutrition"]["nutrients"][3]["unit"]
# sugar
pp meal_info[0]["nutrition"]["nutrients"][5]["title"]
pp meal_info[0]["nutrition"]["nutrients"][5]["amount"]
pp meal_info[0]["nutrition"]["nutrients"][5]["unit"]
# sodium
pp meal_info[0]["nutrition"]["nutrients"][7]["title"]
pp meal_info[0]["nutrition"]["nutrients"][7]["amount"]
pp meal_info[0]["nutrition"]["nutrients"][7]["unit"]
# protein
pp meal_info[0]["nutrition"]["nutrients"][8]["title"]
pp meal_info[0]["nutrition"]["nutrients"][8]["amount"]
pp meal_info[0]["nutrition"]["nutrients"][8]["unit"]
# calcium
pp meal_info[0]["nutrition"]["nutrients"][9]["title"]
pp meal_info[0]["nutrition"]["nutrients"][9]["amount"]
pp meal_info[0]["nutrition"]["nutrients"][9]["unit"]
# cholestrol
pp meal_info[0]["nutrition"]["nutrients"][6]["title"]
pp meal_info[0]["nutrition"]["nutrients"][6]["amount"]
pp meal_info[0]["nutrition"]["nutrients"][6]["unit"]

# i = 0
# while i < meal_info[0]["extendedIngredients"].length
#   pp meal_info[0]["extendedIngredients"][i]["amount"]
#   pp meal_info[0]["extendedIngredients"][i]["unit"]
#   pp meal_info[0]["extendedIngredients"][i]["name"]  
#   i += 1
# end

# meal_info[0]["extendedIngredients"]

# Important Info 
# - title
# - ingredients, amount, units
# - instructions 
# - image (still need to add to meal plan page)
# - cookingMinutes (still need to add to meal plan page)
# - preparationMinutes (still need to add to meal plan page)
# - pricePerServing (still need to add to meal plan page)
# - servings (still need to add to meal plan page)
# - calories (still need to add to meal plan page) 0
# - fat (still need to add to meal plan page) 1
# - carbohydrates (still need to add to meal plan page) 3
# - sugar (still need to add to meal plan page) 5
# - sodium (still need to add to meal plan page) 7
# - protein (still need to add to meal plan page) 8
# - calcium (still need to add to meal plan page) 9
# - cholestrol (still need to add to meal plan page) 6


# Notes 
# - render both cookingMinutes and preperationMinutes on screen and add both together to show the total 
# - still need to add image, cookingMinutes, preparationMinutes, pricePerServing, servings, calories, fat, carbs, sugar, sodium, protein, calcium, and cholestrol to original/home meal plan page