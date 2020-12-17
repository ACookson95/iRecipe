class Api::CookbookRecipesController < ApplicationController
  before_action :set_cookbook, :authenticate_user!

  def index
    render json: @cookbook.cookbook_recipes.order(:created_at)
  end

  def create
    @cookbook_recipe = @cookbook.cookbook_recipes.new(cookbook_recipe_params)
    if @cookbook_recipe.save
      render json: @cookbook_recipe
    else
      render json: @cookbook_recipe.errors, status: 422
    end
  end

  def update
    @cookbook_recipe = @cookbook.cookbook_recipes.find(params[:id])
    if @cookbook_recipe.update(cookbook_recipe_params)
      render json: @cookbook_recipe
    else
      render json: @cookbook_recipe.errors, status: 422
    end
  end

  def destroy
    @cookbook.cookbook_recipes.find(params[:id]).destroy
    render json: { message: 'Recipe Deleted'}
  end

  private

  def set_cookbook
    @cookbook = Cookbook.find(params[:cookbook_id])
  end

  def cookbook_recipe_params
    params.require(:cookbook_recipe).permit(:cookbook_id,:recipe_id, :notes)
  end

end
