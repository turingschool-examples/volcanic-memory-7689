require "rails_helper"

describe "Scientists show page" do
  before :each do
    @lab_1 = Lab.create!(name: "CERN")
    @lab_2 = Lab.create!(name: "SLAC")
    @scientist_1 = @lab_1.scientsts.create!(name: "Planck", specialty: "Physics", university: "University of Munich")
    @scientist_2 = @lab_1.scientsts.create!(name: "Newton", specialty: "Physics", university: "Cambridge")
    @scientist_3 = @lab_2.scientsts.create!(name: "Einstein", specialty: "Physics", university: "University of Zurich")
    @scientist_4 = @lab_2.scientsts.create!(name: "Bohr", specialty: "Physics", university: "	University of Copenhagen")
    @experiment_1 = Experiment.create!(name: "Experiment 1", objective: "Theoretical Physics", num_months: 4)
    @experiment_2 = Experiment.create!(name: "Experiment 2", objective: "Theoretical Physics", num_months: 10)
    @experiment_3 = Experiment.create!(name: "Experiment 3", objective: "Theoretical Physics", num_months: 15)
    @experiment_4 = Experiment.create!(name: "Experiment 4", objective: "Quantum Mechanics", num_months: 12)
    @experiment_5 = Experiment.create!(name: "Experiment 5", objective: "Quantum Mechanics", num_months: 24)
    @experiment_6 = Experiment.create!(name: "Experiment 6", objective: "Quantum Mechanics", num_months: 48)

    @science_experiment_1 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_1)
    @science_experiment_2 = ScientistExperiment.create!(scientist: @scientist_2, experiment: @experiment_1)
    @science_experiment_3 = ScientistExperiment.create!(scientist: @scientist_3, experiment: @experiment_2)
    @science_experiment_4 = ScientistExperiment.create!(scientist: @scientist_4, experiment: @experiment_4)
  end

  describe "User Story 1" do
    it "Displays a Scientist's name, specialty, and university where they got a degree when visiting their show page"

    visit "/scientists/#{@scientist_1.id}"

    expect(page).to have_content("Scientist Information")
    expect(page).to have_content(@scientist_1.name)
    expect(page).to have_content(@scientist_1.specialty)
    expect(page).to have_content(@scientist_1.university)
    expect(page).to have_content(@lab_1.name)
    expect(page).to have_content( @experiment_1)
  end

    it "can remove an experiment for a scientist" do
      expect(page).to have_button("Remove #{@experiment_1.name} from #{@scientist_1.name} page")
      expect(page).to have_button("Remove #{@experiment_3.name} from #{@scientist_1.name} page")
    end
end