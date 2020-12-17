class Api::IngredientsController < ApplicationController
  before_action :set_component 

  def index
    render json: @component.ingredients.order(:created_at)
  end

  def create
    @ingredient= @component.ingredients.new(ingredient_params)
    if @ingredient.save
      render json: @ingredient
    else
      render json: @ingredient.errors, status: 422
    end
  end

  def update
    @ingredient = @component.ingredients.find(params[:id])
    if @ingredient.update(ingredient_params)
      render json: @ingredient
    else
      render json: @ingredient.errors, status: 422
    end
  end

  def destroy
    @component.ingredients.find(params[:id]).destroy
    render json: { message: 'Ingredient Deleted' }
  end

  private

  def set_component
    @component = Component.find(params[:component_id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:component_id,:name,:amount)
  end

end
