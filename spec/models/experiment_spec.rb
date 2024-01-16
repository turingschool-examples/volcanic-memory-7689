require 'rails_helper'

RSpec.describe Experiment, type: :model do
  it { should have_many(:scientist_experiments) }
  it { should have_many(:scientists).through(:scientist_experiments) }

  describe "class methods" do
    it "has an .experiments_over_half_year_desc method" do
      lab1 = Lab.create!(name: "Eco Lab")
      scientist1 = lab1.scientists.create!(name: "Bruno Marfa", specialty: "Ecology", university: "University of Michigan")
      experiment1 = scientist1.experiments.create!(name: "Nocturnal Amphibian Behavior", objective: "Studies the behavior of nocturnal amphibians in relation to light pollution", num_months: 12)
      experiment2 = scientist1.experiments.create!(name: "Bat Population", objective: "Studies the bat population in relation to light pollution", num_months: 9)
      experiment3 = scientist1.experiments.create!(name: "Acid Rain", objective: "Studies the acid rain in relation to industrialization", num_months: 6)
      scientist2 = lab1.scientists.create!(name: "Sonja Brumfield", specialty: "Ecology", university: "University of Michigan")
      experiment4 = scientist2.experiments.create!(name: "Rat Maze", objective: "Studies the intelligence of Rats", num_months: 3)
      experiment5 = scientist2.experiments.create!(name: "Molecular Lab Test", objective: "Studies the smallest bits", num_months: 7)
      experiment6 = scientist2.experiments.create!(name: "Lake Particulates", objective: "Studies lake pollutants", num_months: 60)

      expect(Experiment.experiments_over_half_year_desc.count).to eq(4)
      expect(Experiment.experiments_over_half_year_desc).to eq([experiment6, experiment1, experiment2, experiment5])
    end
  end
end
