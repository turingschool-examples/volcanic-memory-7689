require "rails_helper"

RSpec.describe "the scientist show page" do
  before(:each) do
    @lab_1 = Lab.create!(name: "Fermilab")
    @scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: @lab_1)
    @experiment_1 = Experiment.create!(name: "MINERVA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "water test", objective: "study water molecules", num_months: 2)
    @experiment_3 = Experiment.create!(name: "fire test", objective: "study fire", num_months: 8)

    @scientist_experiment_1 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id)
    @scientist_experiment_2 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id)

    visit scientist_path(@scientist_1)
  end

  describe "User Story 1" do
    # As a visitor
    # When I visit a scientist's show page
    # I see all of that scientist's information including:
    # - name
    # - specialty
    # - university where they got their degree
    # And I see the name of the lab where this scientist works
    # And I see the names of all of the experiments this scientist is running

    it "displays scientist attributes" do
      expect(page).to have_content("Name: #{@scientist_1.name}")
      expect(page).to have_content("Specialty: #{@scientist_1.specialty}")
      expect(page).to have_content("University: #{@scientist_1.university}")
      expect(page).to have_content("Lab: #{@scientist_1.lab.name}")
      expect(page).to have_content("#{@experiment_1.name}")
      expect(page).to have_content("#{@experiment_2.name}")
      expect(page).to_not have_content("#{@experiment_3.name}")

    end
  end
end