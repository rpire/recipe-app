class AddRecipesRefToRecipeFood < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipe_foods, :recipe, null: false, foreign_key: true
    # ALTER TABLE recipe_foods RENAME COLUMN recipes_id TO recipe_id;
  end
end
