class ScientistExperimentsController < ApplicationController

  def destroy 
    # @sci_exp = ScientistExperiment.find(params[:id])
    @sci_exp = ScientistExperiment.find_by(scientist_id: params[:id], experiment_id: params[:format])
    @sci_exp.destroy
    redirect_to scientist_path(@sci_exp.scientist)
  end
end
