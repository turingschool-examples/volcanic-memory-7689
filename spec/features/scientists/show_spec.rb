require 'rails_helper'

RSpec.describe "the scientist show page", type: :feature do
  describe "User Story 1, Scientist Show Page" do
    # As a visitor
    # When I visit a scientist's show page
    # I see all of that scientist's information including:
    #  - name
    #  - specialty
    #  - university where they got their degree
    # And I see the name of the lab where this scientist works
    # And I see the names of all of the experiments this scientist is running
    
    it "shows all of a scientist's attributes, thier lab, and all associated experiments" do
      lab = Lab.create!(name: "Fermilab")
      scientist = lab.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
      experiment_1 = Experiment.create!(name: "Abby Normal", objective: "Assemble and animate a collection of corpses", num_months: 12)
      experiment_2 = Experiment.create!(name: "Pinky Brain", objective: "Try to take over the world!", num_months: 60)
      
      scientist.experiments << experiment_1
      scientist.experiments << experiment_2

      visit scientist_path(scientist)


      expect(page).to have_content(scientist.name)
      expect(page).to have_content(scientist.specialty)
      expect(page).to have_content(scientist.university)

      expect(page).to have_content(scientist.lab.name)

      expect(page).to have_content(experiment_1.name)
      expect(page).to have_content(experiment_2.name)
    end
  end

  describe "User Story 2, Remove an Experiment from a Scientist" do
    # As a visitor
    # When I visit a scientist's show page
    # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
    # When I click that button for one experiment
    # I'm brought back to the scientist's show page
    # And I no longer see that experiment's name listed
    # And when I visit a different scientist's show page that is working on that same experiment,
    # Then I see that the experiment is still on the other scientist's work load"

    it "adds a button to remove an experiment and confirms it works" do
      lab = Lab.create!(name: "Fermilab")
      scientist_1 = lab.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
      scientist_2 = lab.scientists.create!(name: "Jeff Daniels", specialty: "data", university: "Community College")
      experiment = Experiment.create!(name: "Abby Normal", objective: "Assemble and animate a collection of corpses", num_months: 12)
      
      scientist_1.experiments << experiment
      scientist_2.experiments << experiment

      visit scientist_path(scientist_1)

      expect(page).to have_content(experiment.name)
      expect(page).to have_button("Remove")
      
      click_button("Remove")
      
      expect(current_path).to eq(scientist_path(scientist_1))
      expect(page).to_not have_content(experiment.name)
      
      visit scientist_path(scientist_2)
      
      expect(page).to have_content(experiment.name)
      expect(page).to have_button("Remove")
    end
  end
end
