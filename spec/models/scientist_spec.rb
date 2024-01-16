require 'rails_helper'

RSpec.describe Scientist do
  it {should belong_to :lab}
  it { should have_many(:scientist_experiments) }
  it { should have_many(:experiments).through(:scientist_experiments) }

  describe "instance methods" do
    it "has a #experiment_count method" do
      lab1 = Lab.create!(name: "Eco Lab")
      scientist1 = lab1.scientists.create!(name: "Bruno Marfa", specialty: "Ecology", university: "University of Michigan")
      experiment1 = scientist1.experiments.create!(name: "Nocturnal Amphibian Behavior", objective: "Studies the behavior of nocturnal amphibians in relation to light pollution", num_months: 12)
      experiment2 = scientist1.experiments.create!(name: "Bat Population", objective: "Studies the bat population in relation to light pollution", num_months: 9)
      scientist2 = lab1.scientists.create!(name: "Sonja Brumfield", specialty: "Ecology", university: "University of Michigan")
      experiment4 = scientist2.experiments.create!(name: "Rat Maze", objective: "Studies the intelligence of Rats", num_months: 3)
      experiment5 = scientist2.experiments.create!(name: "Molecular Lab Test", objective: "Studies the smallest bits", num_months: 7)
      experiment6 = scientist2.experiments.create!(name: "Lake Particulates", objective: "Studies lake pollutants", num_months: 60)
      experiment7 = scientist2.experiments.create!(name: "Acid Rain", objective: "Studies the acid rain in relation to industrialization", num_months: 6)
      scientist3 = lab1.scientists.create!(name: "Billy Bob", specialty: "Biology", university: "University of Wisconsin")
      experiment8 = scientist3.experiments.create!(name: "Sheep 13", objective: "Studies the sheep population in relation to light pollution", num_months: 1)
      experiment9 = scientist3.experiments.create!(name: "Bovine 23", objective: "Studies the bovine population in relation to light pollution", num_months: 2)
      experiment10 = scientist3.experiments.create!(name: "Wild Animals", objective: "Studies the wild animal behavior in relation to light pollution", num_months: 3)
      experiment11 = scientist3.experiments.create!(name: "Human Toll", objective: "Studies the human mental health in relation to light pollution", num_months: 4)
      experiment12 = scientist3.experiments.create!(name: "Birds", objective: "Studies the birds migration in relation to light pollution", num_months: 5)

      expect(scientist1.experiment_count).to eq(2)
      expect(scientist2.experiment_count).to eq(4)
      expect(scientist3.experiment_count).to eq(5)
    end
  end
end
