class LabsController < ApplicationController

  def show
    @lab = Lab.find(params[:id])
    @scientists = @lab.scientists
  end
end