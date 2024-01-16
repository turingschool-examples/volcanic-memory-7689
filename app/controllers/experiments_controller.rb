class ExperimentsController < ApplicationController
  def destroy
    scientist = Scientist.find(params[:scientist_id])
    scientist.remove_experiment(params[:id])

    redirect_to scientist_path(scientist)
  end
end
