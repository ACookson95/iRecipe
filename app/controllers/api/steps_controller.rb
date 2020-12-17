class Api::StepsController < ApplicationController
  before_action :set_recipe 

  def index
    render json: @recipe.steps.order(:created_at)
  end

  def create
    @step= @recipe.steps.new(step_params)
    if @step.save
      render json: @step
    else
      render json: @step.errors, status: 422
    end
  end

  def update
    @step = @recipe.steps.find(params[:id])
    if @step.update(step_params)
      render json: @step
    else
      render json: @step.errors, status: 422
    end
  end

  def destroy
    @recipe.steps.find(params[:id]).destroy
    render json: { message: 'Step Deleted' }
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def step_params
    params.require(:step).permit(:recipe_id,:name)
  end

end
