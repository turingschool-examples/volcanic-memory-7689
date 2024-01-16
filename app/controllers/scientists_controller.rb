class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
  end

  # I feel that this makes the most sense - I put the destroy action in the Experiments Controller.
  # Since removing an experiment is within the context of a scientist, I feel that it fits here and follows CRUD. 
  
  def destroy_experiment
    @scientist = Scientist.find(params[:scientist_id])
    @scientist.remove_experiment(params[:id])

    redirect_to scientist_path(@scientist)
  end
end