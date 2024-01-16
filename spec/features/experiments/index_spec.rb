require "rails_helper" 

RSpec.describe "experiments index page", type: :feature do
  before(:each) do 
    @covid_2024 = Experiment.create!(name: "Annual COVID Test", objective: "Test the strength of the current year's COVID strain", num_months: 2)
    @horticulture = Experiment.create!(name: "Plant Infestation", objective: "Radiation duration in plants", num_months: 36)
    @nuclear = Experiment.create!(name: "Nuclear Radiation", objective: "Test half-life of nuclear radiation", num_months: 60)
    @atomic = Experiment.create!(name: "Atomic Radiation", objective: "Test strength of atomic radiation", num_months: 48)
  end

  it "displays the names of experiments running longer than six months in descending order (by experiment duration)" do 
    visit experiments_path 

    expect("Nuclear Radiation").to appear_before("Atomic Radiation")
    expect("Atomic Radiation").to appear_before("Plant Infestation")

    expect(page).to_not have_content("Annual COVID Test")
  end

end