class ScientistExperimentsController < ApplicationController

  def destroy
    scientist = Scientist.find(params[:sci_id])
    sci_exp = scientist.find_it(params[:exp_id], scientist.id).first
    sci_exp.destroy
    redirect_to "/scientists/#{params[:sci_id]}"
  end


end