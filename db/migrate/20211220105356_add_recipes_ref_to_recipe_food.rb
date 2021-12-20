class AddRecipesRefToRecipeFood < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipe_foods, :recipes, null: false, foreign_key: true
  end
end
