class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.long_running_experiments
  end

  def destroy
    scientist = Scientist.find(params[:scientist_id])
    scientist.remove_experiment(params[:id])

    redirect_to scientist_path(scientist)
  end
end
