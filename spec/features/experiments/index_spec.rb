require 'rails_helper'

RSpec.describe "the experiments index page", type: :feature do
  describe "User Story 3, Experiment Index Page" do
    # As a visitor
    # When I visit the experiment index page
    # I see the names of all long running experiments (longer than 6 months),
    # And I see the names are in descending order (longest to shortest)

    it "lists the longest running experiments in order" do
      lab = Lab.create!(name: "Fermilab")
      scientist = lab.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
      experiment_1 = Experiment.create!(name: "Abby Normal", objective: "Assemble and animate a collection of corpses", num_months: 12)
      experiment_2 = Experiment.create!(name: "Pinky Brain", objective: "Try to take over the world!", num_months: 60)
      experiment_3 = Experiment.create!(name: "Brain", objective: "Pull weeds", num_months: 5)
      
      scientist.experiments << experiment_1
      scientist.experiments << experiment_2
      scientist.experiments << experiment_3

      visit experiments_path

      expect(page).to have_content(experiment_1.name)
      expect(page).to have_content(experiment_2.name)
      expect(page).to_not have_content(experiment_3.name)
    end
  end
end