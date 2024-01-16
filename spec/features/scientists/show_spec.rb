require 'rails_helper'

RSpec.describe "Scientist Show Page" do
  before(:each) do
    @lab_1 = Lab.create!(name: "Fermilab")
    @lab_2 = Lab.create!(name: "Time-X")

    @scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab_id: @lab_1.id)
    @scientist_2 = Scientist.create!(name: "George", specialty: "time-travel", university: "MIT", lab_id: @lab_2.id)

    @experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "Time Pod", objective: "create a time traveling machine", num_months: 1)


    @scientist_experiments_1 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id)
    @scientist_experiments_2 = ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_2.id)

    visit scientist_path(@scientist_1)
  end

  describe "User Story 1 - Scientist Show Page" do
    it "displays the Scientist's name, specialty, university, lab, and experiments" do
      expect(page).to have_content("Name: Marie Curie")
      expect(page).to have_content("Specialty: radioactivity")
      expect(page).to have_content("University: University of Paris")
      expect(page).to have_content("Lab: Fermilab")
      expect(page).to have_content("Experiments: MINERvA")
    end
  end
end
