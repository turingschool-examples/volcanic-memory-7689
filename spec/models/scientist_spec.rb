require 'rails_helper'

RSpec.describe Scientist do
  describe "associations" do
    it {should belong_to :lab}
    it {should have_many :scientist_experiments}
    it {should have_many(:experiments).through(:scientist_experiments)}
  end

  describe "model methods" do
    it "has a find scienist experiment method" do
      lab_1 = Lab.create!(name: "Ecology Central")
      scientist_1 = Scientist.create!(name: "Tommy Kitchen", specialty: "Ecology", university: "Columbia", lab_id: lab_1.id)
      scientist_2 = Scientist.create!(name: "Karen", specialty: "cosmology", university: "UC Berkeley", lab_id: lab_1.id)

      exp_1 = Experiment.create!(name: "Life on Mars", objective: "To find life on Mars", num_months: 65)
      exp_2 = Experiment.create!(name: "Swamp Life", objective: "To explore swamp life", num_months: 25)
      
      scientist_experiment_1 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_1.id)
      scientist_experiment_2 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_2.id)
      scientist_experiment_3 = ScientistExperiment.create!(scientist_id: scientist_2.id, experiment_id: exp_1.id)
      
      expect(scientist_1.find_it(exp_1.id, scientist_1.id)).to eq([scientist_experiment_1])
    end

    it "has a #count_exp for scientist" do
      lab_1 = Lab.create!(name: "Ecology Central")
      scientist_1 = Scientist.create!(name: "Tommy Kitchen", specialty: "Ecology", university: "Columbia", lab_id: lab_1.id)
      scientist_2 = Scientist.create!(name: "Karen", specialty: "cosmology", university: "UC Berkeley", lab_id: lab_1.id)

      exp_1 = Experiment.create!(name: "Life on Mars", objective: "To find life on Mars", num_months: 65)
      exp_2 = Experiment.create!(name: "Swamp Life", objective: "To explore swamp life", num_months: 25)
      
      scientist_experiment_1 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_1.id)
      scientist_experiment_2 = ScientistExperiment.create!(scientist_id: scientist_1.id, experiment_id: exp_2.id)
      scientist_experiment_3 = ScientistExperiment.create!(scientist_id: scientist_2.id, experiment_id: exp_1.id)
      
      expect(scientist_1.count_exp).to eq(2)
      expect(scientist_2.count_exp).to eq(1)
    end
  end
end