class ExperimentsController < ApplicationController

  def index
    @experiments = Experiment.all
    @long_running_experiments = Experiment.long_running_experiments
  end

end