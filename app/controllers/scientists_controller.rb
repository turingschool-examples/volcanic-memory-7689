class ScientistsController < ApplicationController
  def show 
    @sci = Scientist.find(params[:id])
  end
end