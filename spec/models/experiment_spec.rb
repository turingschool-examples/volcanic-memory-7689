require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many :scientist_experiments}
  it {should have_many :scientists}

  before(:each) do
    @lab_1 = Lab.create!(name: "Fermilab")
  
    @scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: @lab_1)
    @scientist_2 = Scientist.create!(name: "Albert Einstein", specialty: "relativity", university: "University of Zurich", lab: @lab_1)
  
    @experiment_1 = Experiment.create!(name: "MINERVA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "water test", objective: "study water molecules", num_months: 2)
    @experiment_3 = Experiment.create!(name: "fire test", objective: "study fire", num_months: 8)
    @experiment_4 = Experiment.create!(name: "rock test", objective: "study rocks", num_months: 12)
  
    @scientist_experiment_1 = ScientistExperiment.create!(scientist_id:@scientist_1.id, experiment_id: @experiment_1.id)
    @scientist_experiment_2 = ScientistExperiment.create!(scientist_id:@scientist_1.id, experiment_id: @experiment_2.id)
    @scientist_experiment_3 = ScientistExperiment.create!(scientist_id:@scientist_2.id, experiment_id: @experiment_1.id)
  end

  it "can return long_running_experiments sorted longest to shortest" do
    expect(Experiment.long_running_experiments).to eq([@experiment_4, @experiment_3])
  end
end