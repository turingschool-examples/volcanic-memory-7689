class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.where("num_months > 6").order(num_months: :desc)
  end

end