class Lab::ScientistsController < ApplicationController     
    def show 
      @scientist = Scientist.find(params[:id])
      #@lab = Scientist.find(scientist.lab_id)
    end
  end