class RecipeFood < ApplicationRecord
    belongs_to :recipe, :food
end
