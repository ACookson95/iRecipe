class Api::ComponentsController < ApplicationController
  before_action :set_recipe 

  def index
    render json: @recipe.components.order(:created_at)
  end

  def create
    @component= @recipe.components.new(component_params)
    if @component.save
      render json: @component
    else
      render json: @component.errors, status: 422
    end
  end

  def update
    @component = @recipe.components.find(params[:id])
    if @component.update(component_params)
      render json: @component
    else
      render json: @component.errors, status: 422
    end
  end

  def destroy
    @recipe.components.find(params[:id]).destroy
    render json: { message: 'Component Deleted' }
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def component_params
    params.require(:component).permit(:recipe_id,:name)
  end

end
