class User < ApplicationRecord
  has_many :user_ingredients, foreign_key: :user_id
  has_many :recipe_ingredients, foreign_key: :user_id
  has many :ingredients, through: :user_ingredients, foreign_key: :ingredient_id
  has many :recipes, through: :user_recipes, foreign_key: :recipe_id

  def self.sign_in_from_omniauth(auth)
    find_by(provider:auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omni(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name']
    )
  end


end