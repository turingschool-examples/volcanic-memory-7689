class ExperimentsController < ApplicationController

  def index
    @experiments = Experiment.six_months
  end

end