class ScientistsController < ApplicationController

  # def create
  #   @scientist = Scientist.create!(scientist_params)
  # end

  def show
    @scientist = Scientist.find(params[:id])
  end

  # private

  # def scientist_params
  #   params.permit(:id, :name, :specialty, :university, :lab_id, :created_at, :updated_at)
  # end

end