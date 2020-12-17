class Api::RecipesController < ApplicationController
  before_action :set_user

  def index
    render json: @user.recipes.order(:created_at)
  end

  def create
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      render json: @recipe
    else
      render json: @recipe.errors, status: 422
    end
  end

  def update
    @recipe = @user.recipes.find(params[:id])
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: 422
    end
  end

  def destroy
    @user.recipes.find(params[:id]).destroy
    render json: { message: 'Recipe Deleted'}
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :description, :cooktime, :preptime, :public, :servings, :notes)
  end

end
