class ScientistExperimentsController < ApplicationController

  def update
    @scientist_experiment = ScientistExperiment.find(params[:id])
    @scientist = @scientist_experiment.scientist
    @experiment = @scientist_experiment.experiment

    @scientist_experiment.update(scientist_experiment_params)

    redirect_to scientist_path(@scientist)
  end

  private

  def scientist_experiment_params
    params.permit(:id, :active, :scientist_id, :experiment_id, :created_at, :updated_at)
  end

end