require "rails_helper" 

RSpec.describe "labs show page", type: :feature do
  before(:each) do 
    @radion = Lab.create!(name: "Radion Labs")
    @curie = Scientist.create!(name: "Marie Curie", specialty: "Radiology", university: "University of Paris", lab_id: @radion.id)
    @einstein = Scientist.create!(name: "Albert Einstein", specialty: "Nuclear Physics", university: "German Institute of Technology", lab_id: @radion.id)
    @salk = Scientist.create!(name: "Jonas Salk", specialty: "Infectious Disease", university: "MIT", lab_id: @radion.id)
    @horticulture = Experiment.create!(name: "Plant Infestation", objective: "Radiation duration in plants", num_months: 36)
    @atomic = Experiment.create!(name: "Atomic Radiation", objective: "Test strength of atomic radiation", num_months: 48)
    @nuclear = Experiment.create!(name: "Nuclear Radiation", objective: "Test half-life of nuclear radiation", num_months: 60)
    @polio = Experiment.create!(name: "Polio Vaccine", objective: "Develop cure for Polio", num_months: 113)
    @curie.experiments << @horticulture
    @curie.experiments << @atomic
    @curie.experiments << @nuclear
    @einstein.experiments << @atomic
    @einstein.experiments << @nuclear
    @salk.experiments << @polio
  end

  it "displays the names of all scientists who work at the lab, in descending order of experiments they are working on" do 
    visit lab_path(@radion.id)
    save_and_open_page
    expect(page).to have_content("Radion Labs")
    expect("Marie Curie - 3").to appear_before("Albert Einstein - 2")
    expect("Albert Einstein - 2").to appear_before("Jonas Salk - 1")
  end
end