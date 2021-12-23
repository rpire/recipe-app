class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = current_user.recipes.all
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @foods = current_user.foods.all if user_signed_in?
    @ingredients = Food.select('name, recipe_foods.id, user_id').joins(:recipe_foods).where("recipe_id = #{@recipe.id}")
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      flash[:notice] = 'Recipe deleted!'
    else
      flash[:alert] = "Failed to remove recipe - #{recipe.errors.full_messages.first}"
    end
    redirect_to recipes_path
  end

  def create
    @recipe = current_user.recipes.new(create_params)
    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:notice] = 'Recipe was successfully created.'
        else
          flash[:alert] = "Failed to add recipe - #{@recipe.errors.full_messages.first}"
        end
        redirect_to recipes_path
      end
    end
  end

  private

  def create_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
