class ShoppingListController < ApplicationController
  def index
    @recipes = Recipe.includes(recipe_foods: :food).where(user_id: current_user.id)
  end
end
