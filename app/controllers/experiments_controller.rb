class ExperimentsController < ApplicationController
    before_action :find_lab, only: [:index]

    def index

    end

    private

    def find_lab
        @lab = Lab.find(params[:lab_id])
    end
end
