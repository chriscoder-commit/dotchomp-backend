class RecipesController < ApplicationController
  # before_action :set_recipe, only: [:update]

  def index
    @recipes = Recipes.all
  end 
  
  def create 
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id

    if recipe.save
      render status: :created
    else 
      render status: :unprocessable_entity
    end 
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: user.recipe
  end

  def update
  end

  def destroy
  end 

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end 

  def recipe_params
    params.require(:recipe).permit(:ingredients, :cuisine, :prep_time, :cook_time, :serves, :photo)
  end

end
