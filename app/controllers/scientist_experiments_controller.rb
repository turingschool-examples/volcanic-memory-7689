class ScientistExperimentsController < ApplicationController
  def destroy
    @scientist_experiment = ScientistExperiment.find_by(scientist_id: params[:scientist_id], experiment_id: params[:id])
    @scientist_experiment.destroy
    redirect_to "/labs/#{params[:lab_id]}/scientists/#{params[:scientist_id]}"
  end
end
