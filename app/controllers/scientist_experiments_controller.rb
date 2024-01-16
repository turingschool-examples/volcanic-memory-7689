class ScientistExperimentsController < ApplicationController
  def destroy
    scientist_experiment = ScientistExperiment.find(params[:id])
    scientist = Scientist.find(params[:scientist_id])
    scientist_experiment.destroy
    redirect_to "/scientists/#{scientist.id}"
  end
end