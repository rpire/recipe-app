class RecipesController < ApplicationController
    load_and_authorize_resource
    
    def index
        @recipes = current_user.recipes
    end

    def show

    end

    def create
        recipe = current_user.recipe.new(text: comment_params[:text], user: current_user)
        respond_to do |format|
          format.html do
            if recipe.save
              flash[:notice] = 'Recipe was successfully created.'
            else
              flash[:alert] = 'Failed to add recipe!'
            end
            redirect_to recipes_path
          end
        end
      end
      
end
