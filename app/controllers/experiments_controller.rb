class ExperimentsController < ApplicationController

  def index 
    @exps = Experiment.all
  end 
end