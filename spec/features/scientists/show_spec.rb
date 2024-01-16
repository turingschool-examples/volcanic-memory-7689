require "rails_helper"

describe Scientist do
  describe "show page" do
    it "displays all of a scientist's information" do
      lab_1 = Lab.create!(name: "Ecology Central")
      scientist_1 = Scientist.create!(name: "Tommy Kitchen", specialty: "Ecology", university: "Columbia", lab_id: lab_1.id)
      scientist_2 = Scientist.create!(name: "Karen", specialty: "cosmology", university: "UC Berkeley", lab_id: lab_1.id)
      
      exp_1 = Experiment.create!(name: "Life on Mars", objective: "To find life on Mars", num_months: 65)
      exp_2 = Experiment.create!(name: "Swamp Life", objective: "To explore swamp life", num_months: 25)
      
      scientist_experiment_1 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_1.id)
      scientist_experiment_2 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_2.id)
      scientist_experiment_3 = ScientistExperiment.create!(scientist_id: scientist_2.id, experiment_id: exp_1.id)
      
      visit "/scientists/#{scientist_1.id}"

      expect(page).to have_content("Ecology Central")
      expect(page).to have_content("Tommy Kitchen")
      expect(page).to have_content("Ecology")
      expect(page).to have_content("Columbia")
      expect(page).to have_content("Life on Mars")
      expect(page).to have_content("Swamp Life")
    end

    it "has a feature to remove an experiment from a scientist's page" do
      lab_1 = Lab.create!(name: "Ecology Central")
      scientist_1 = Scientist.create!(name: "Tommy Kitchen", specialty: "Ecology", university: "Columbia", lab_id: lab_1.id)
      scientist_2 = Scientist.create!(name: "Karen", specialty: "cosmology", university: "UC Berkeley", lab_id: lab_1.id)

      exp_1 = Experiment.create!(name: "Life on Mars", objective: "To find life on Mars", num_months: 65)
      exp_2 = Experiment.create!(name: "Swamp Life", objective: "To explore swamp life", num_months: 25)
      
      scientist_experiment_1 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_1.id)
      scientist_experiment_2 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_2.id)
      scientist_experiment_3 = ScientistExperiment.create!(scientist_id: scientist_2.id, experiment_id: exp_1.id)
      
      visit "/scientists/#{scientist_1.id}"
      expect(page).to have_content("Life on Mars")

      within("#exp-#{exp_1.id}") do
        click_button "Remove Experiment"
      end

      expect(current_path).to eq("/scientists/#{scientist_1.id}")
      expect(page).to_not have_content("Life on Mars")
      
      visit "/scientists/#{scientist_2.id}"
      expect(page).to have_content("Life on Mars")
    end
  end
end
