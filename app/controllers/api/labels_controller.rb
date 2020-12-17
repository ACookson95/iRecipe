class Api::LabelsController < ApplicationController
  
  def index
    render json: Label.all.order(:created_at)
  end

  def create
    label = Label.new(label_params)
    if label.save
      render json: label
    else
      render json: label.errors, status: 422
    end
  end

  def update
    label = Label.find(params[:id])
    if course.update(label_params)
      render json: label
    else
      render json: label.errors, status: 422
    end
  end

  def destroy
    Label.find(params[:id]).destroy
    render json: { message: 'Label Deleted' }
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end

end
