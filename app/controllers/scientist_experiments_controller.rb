class ScientistExperimentsController < ApplicationController     
    def destroy
        scientist_experiment = ScientistExperiment.find_by(scientist_id: params[:id], experiment_id: params[:format])

        scientist_experiment.destroy

        scientist = Scientist.find(params[:id])
        redirect_to "/labs/#{scientist.lab.id}/scientists/#{scientist.id}"
    end
end