require "rails_helper"

describe "Experiment Index page" do
  before :each do
    @lab1 = Lab.create!(name: "CERN")
    @lab2 = Lab.create!(name: "SLAC")
    @scientist_1 = Scientist.create!(name: "Planck", specialty: "Physics", university: "University of Munich", lab_id: @lab1.id)
    @scientist_2 = Scientist.create!(name: "Newton", specialty: "Physics", university: "Cambridge", lab_id: @lab1.id)
    @scientist_3 = Scientist.create!(name: "Einstein", specialty: "Physics", university: "University of Zurich", lab_id: @lab2.id)
    @scientist_4 = Scientist.create!(name: "Bohr", specialty: "Physics", university: "	University of Copenhagen", lab_id: @lab2.id)
    @experiment_1 = Experiment.create!(name: "Experiment 1", objective: "Theoretical Physics", num_months: 4)
    @experiment_2 = Experiment.create!(name: "Experiment 2", objective: "Theoretical Physics", num_months: 10)
    @experiment_3 = Experiment.create!(name: "Experiment 3", objective: "Theoretical Physics", num_months: 15)
    @experiment_4 = Experiment.create!(name: "Experiment 4", objective: "Quantum Mechanics", num_months: 12)
    @experiment_5 = Experiment.create!(name: "Experiment 5", objective: "Quantum Mechanics", num_months: 24)
    @experiment_6 = Experiment.create!(name: "Experiment 6", objective: "Quantum Mechanics", num_months: 48)
  end

end