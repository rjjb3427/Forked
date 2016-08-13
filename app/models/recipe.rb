class Recipe < ApplicationRecord
  has_many :user_recipes, foreign_key: :recipe_id
  has_many :recipe_ingredients, foreign_key: :recipe_id
  has many :users, through: :user_recipes, foreign_key: :user_id
  has many :ingredients, through: :recipe_ingredients, foreign_key: :ingredient_id
end