class ScientistExperimentsController < ApplicationController
    before_action :find_lab_and_scientist_experiment, only: [:destroy]

    def destroy
        @scientist_experiment.destroy
        redirect_to lab_scientist_path(@lab, @scientist)
    end

    private

    def find_lab_and_scientist_experiment
        @lab = Lab.find(params[:lab_id])
        @scientist_experiment = ScientistExperiment.find_by(scientist_id: params[:scientist_id], experiment_id: params[:experiment_id])
        @scientist = @scientist_experiment.scientist
    end
end
