class ScientistsController < ApplicationController
    before_action :find_scientist_and_lab, only: [:show]

    def show

    end

    private

    def find_scientist_and_lab
        @scientist = Scientist.find(params[:id])
        @lab = Lab.find(params[:lab_id])
    end
end
