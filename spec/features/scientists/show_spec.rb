require "rails_helper"

RSpec.describe "the scientist show page" do
  before(:each) do
    @lab_1 = Lab.create!(name: "Fermilab")
    @scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: @lab_1)

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
      expect(page).to have_content("Lab: #{@scientist_1.experiments}") # does this need to be name?
    end
  end
end