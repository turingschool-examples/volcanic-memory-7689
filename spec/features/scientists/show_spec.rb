require "rails_helper"

RSpec.describe "the scientist show page" do
  before(:each) do
    @lab_1 = Lab.create!(name: "Fermilab")

    @scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: @lab_1)
    @scientist_2 = Scientist.create!(name: "Albert Einstein", specialty: "relativity", university: "University of Zurich", lab: @lab_1)

    @experiment_1 = Experiment.create!(name: "MINERVA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "water test", objective: "study water molecules", num_months: 2)
    @experiment_3 = Experiment.create!(name: "fire test", objective: "study fire", num_months: 8)

    @scientist_experiment_1 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id, active: true)
    @scientist_experiment_2 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id, active: true)
    @scientist_experiment_3 = ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_1.id, active: true)

    visit scientist_path(@scientist_1)
  end

  describe "User Story 1, Scientist Show Page" do
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

  describe "User Story 2, Remove an Experiment from a Scientist" do
    # As a visitor
    # When I visit a scientist's show page
    # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
    # When I click that button for one experiment
    # I'm brought back to the scientist's show page
    # And I no longer see that experiment's name listed
    # And when I visit a different scientist's show page that is working on that same experiment,
    # Then I see that the experiment is still on the other scientist's work load

    it "has a button to remove an experiment from that scientist's work load" do
      expect(page).to have_content("#{@experiment_1.name}")

      within("tr:contains('#{@experiment_1.name}')") do
        expect(page).to have_button("Remove")
        click_button("Remove")
      end
      
      expect(current_path).to eq(scientist_path(@scientist_1))

      within('table') do
        expect(page).to_not have_content(@experiment_1.name)
      end
      visit scientist_path(@scientist_2)
      expect(page).to have_content(@experiment_1.name)
    end
  end
end