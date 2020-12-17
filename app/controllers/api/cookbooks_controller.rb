class Api::CookbooksController < ApplicationController
  before_action :set_user, :authenticate_user!

  def index
    render json: @user.cookbooks.order(:created_at)
  end

  def create
    @cookbook = @user.cookbooks.new(cookbook_params)
    if @cookbook.save
      render json: @cookbook
    else
      render json: @cookbook.errors, status: 422
    end
  end

  def update
    @cookbook = @user.cookbooks.find(params[:id])
    if @cookbook.update(cookbook_params)
      render json: @cookbook
    else
      render json: @cookbook.errors, status: 422
    end
  end

  def destroy
    @user.cookbooks.find(params[:id]).destroy
    render json: { message: 'Cookbook Deleted'}
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:user_id, :name, :cover)
  end

end
