class ScientistExperimentsController < ApplicationController
  def destroy
    @scientist_experiment = ScientistExperiment.where("scientist_id = ? and experiment_id = ?", params[:scientist_id], params[:id]).first
    ScientistExperiment.destroy(@scientist_experiment.id)

    redirect_to scientist_path(params[:scientist_id])
  end
end
