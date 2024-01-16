class ExperimentsController < ApplicationController
  def destroy
    @lab = Lab.find(params[:lab_id])
    @scientist = Scientist.find(params[:scientist_id])
    experiment = @scientist.experiments.find(params[:id])
    @scientist.experiments.delete(experiment)
    redirect_to "/labs/#{@lab.id}/scientists/#{@scientist.id}"
  end

  def index
    @experiments = Experiment.all
  end
end
