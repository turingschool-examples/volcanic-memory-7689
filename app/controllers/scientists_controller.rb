class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
  end

  def update
    @scientist = Scientist.find(params[:id])
    
    if params[:remove_experiment_id]
      experiment = Experiment.find(params[:remove_experiment_id])
      @scientist.experiments.delete(experiment)
      redirect_to scientist_path(@scientist)
    end
  end
end
