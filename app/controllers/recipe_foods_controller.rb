class RecipeFoodsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = recipe.recipe_foods.new(
      quantity: params[:quantity],
      food_id: params[:food_id]
    )
    respond_to do |format|
      format.html do
        if @recipe_foods.save
          flash[:notice] = 'Ingredient succesfully added'
        else
          flash[:alert] = "Failed to add ingredient - #{@recipe_foods.errors.full_messages.first}"
        end
        redirect_to recipe_path(params[:recipe_id])
      end
    end
  end

  def destroy
    ingredient = RecipeFood.find(params[:id])
    if ingredient.destroy
      flash[:notice] = 'Ingredient deleted!'
    else
      flash[:alert] = "Failed to remove ingredient - #{ingredient.errors.full_messages.first}"
    end
    redirect_to recipe_path(params[:recipe_id])
  end
end
