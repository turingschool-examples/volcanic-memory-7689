class LabScientistsController < ApplicationController
  def show
    @lab = Lab.find(params[:lab_id])
    @scientist = Scientist.find(params[:id])
  end
end
