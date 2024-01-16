require "rails_helper"

RSpec.describe "the experiments show page" do
  before(:each) do
    @lab_1 = Lab.create!(name: "Fermilab")

    @scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: @lab_1)
    @scientist_2 = Scientist.create!(name: "Albert Einstein", specialty: "relativity", university: "University of Zurich", lab: @lab_1)

    @experiment_1 = Experiment.create!(name: "MINERVA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "water test", objective: "study water molecules", num_months: 2)
    @experiment_3 = Experiment.create!(name: "fire test", objective: "study fire", num_months: 8)
    @experiment_4 = Experiment.create!(name: "rock test", objective: "study rocks", num_months: 12)

    @scientist_experiment_1 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id, active: true)
    @scientist_experiment_2 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id, active: true)
    @scientist_experiment_3 = ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_1.id, active: true)

    visit experiments_path
  end

  describe "User Story 3, Experiment Index Page" do
    # As a visitor
    # When I visit the experiment index page
    # I see the names of all long running experiments (longer than 6 months),
    # And I see the names are in descending order (longest to shortest)

    it "displays experiments" do
      expect(page).to have_content(@experiment_3.name) # add launchy logic
      expect(page).to have_content(@experiment_4.name) # add launchy logic
      expect(page).to_not have_content(@experiment_1.name)
      expect(page).to_not have_content(@experiment_2.name)
    end
  end
end