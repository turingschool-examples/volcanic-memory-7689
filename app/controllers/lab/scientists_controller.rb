class Lab::ScientistsController < ApplicationController     
  def show 
    @scientist = Scientist.find(params[:id])
  end
end