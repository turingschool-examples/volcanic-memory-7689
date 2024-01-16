require 'rails_helper'

RSpec.describe "Scientist Show Page" do
  before(:each) do
    @lab_1 = Lab.create!(name: "Fermilab")
    @lab_2 = Lab.create!(name: "Time-X")

    @scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab_id: @lab_1.id)
    @scientist_2 = Scientist.create!(name: "George", specialty: "time-travel", university: "MIT", lab_id: @lab_2.id)

    @experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "Time Pod", objective: "create a time traveling machine", num_months: 1)


    @marie_minerva = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id)
    @marie_time_pod = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id)
    @scientist_experiments_2 = ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_2.id)

    visit scientist_path(@scientist_1.id)
  end

  describe "User Story 1 - Scientist Show Page" do
    it "displays the Scientist's name, specialty, university, lab, and experiments" do
      expect(page).to have_content("Name: Marie Curie")
      expect(page).to have_content("Specialty: radioactivity")
      expect(page).to have_content("University: University of Paris")
      expect(page).to have_content("Lab: Fermilab")
      expect(page).to have_content("Experiments: MINERvA, Time Pod")
    end
  end

  describe "User Story 2 - Remove an Experiment from a Scienetist" do
    it "has a functioning button to remove every experiment listed from the Scientist, and will not affect another scientist working on the same project" do
      save_and_open_page
      within "#experiment-#{@experiment_1.id}" do
        expect(page).to have_button("Remove")
      end
      within "#experiment-#{@experiment_2.id}" do
        expect(page).to have_button("Remove")
        click_button("Remove")
      end

      expect(page.current_path).to eq(scientist_path(@scientist_1.id))
      expect(page).to have_no_content("Time Pod")

      visit scientist_path(@scientist_2.id)

      expect(page).to have_content("Time Pod")
    end
  end
end
