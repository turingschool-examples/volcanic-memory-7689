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
      lab = Lab.create!(name: “Fermilab”)
      scientist = lab.scientist.create!(name: “Marie Curie”, specialty: “radioactivity”, university: “University of Paris”)
      experiment_1 = (name: "Abby Normal", objective: "Assemble and animate a collection of corpses", num_months: 12)
      experiment_2 = (name: "Pinky Brain", objective: "Try to take over the world!", num_months: 60)
      
      visit scientist_path

      expect(page).to have_content(scientist.name)
      expect(page).to have_content(scientist.specialty)
      expect(page).to have_content(scientist.university)

      expect(page).to have_content(lab.scientist.name)

      expect(page).to have_content(experiment_1.name)
      expect(page).to have_content(experiment_2.name)
    end
end
