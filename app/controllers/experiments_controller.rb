class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.where("num_months > 6").order(num_months: :desc)
  end

  def update
    @scientist = Scientist.find(params[:scientist_id])
    experiment = Experiment.find(params[:id])
    @scientist.experiments.delete(experiment)
    
    redirect_to scientist_path(@scientist)
  end

end