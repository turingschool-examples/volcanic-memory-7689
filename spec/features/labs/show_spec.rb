require "rails_helper"

describe Lab do
  describe "show page" do
    it "displays lab information" do
      lab_1 = Lab.create!(name: "Ecology Central")
      scientist_1 = Scientist.create!(name: "Tommy Kitchen", specialty: "Ecology", university: "Columbia", lab_id: lab_1.id)
      scientist_2 = Scientist.create!(name: "Karen", specialty: "cosmology", university: "UC Berkeley", lab_id: lab_1.id)
      
      exp_1 = Experiment.create!(name: "Life on Mars", objective: "To find life on Mars", num_months: 65)
      exp_2 = Experiment.create!(name: "Swamp Life", objective: "To explore swamp life", num_months: 25)
      exp_3 = Experiment.create!(name: "Kid's Fair", objective: "To educate", num_months: 3)
      exp_4 = Experiment.create!(name: "Volcano Time", objective: "To look at a volcano", num_months: 12)
      
      scientist_experiment_1 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_1.id)
      scientist_experiment_2 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_2.id)
      scientist_experiment_3 = ScientistExperiment.create!(scientist_id: scientist_2.id, experiment_id: exp_1.id)
      
      visit "/labs/#{lab_1.id}"
      expect(page).to have_content("Ecology Central")
      expect(page).to have_content("Tommy Kitchen")
      expect(page).to have_content("Karen")

      expect(page).to have_content(1)
      expect(page).to have_content(2)

      expect("Tommy Kitchen").to appear_before("Karen")
    end
  end
end
