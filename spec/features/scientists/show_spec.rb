require "rails_helper" 

RSpec.describe "scientist show page" do 
  before(:each) do 
    @radion = Lab.create!(name: "Radion Labs")
    @curie = Scientist.create!(name: "Marie Curie", specialty: "Radiology", university: "University of Paris", lab_id: @radion.id)
    @horticulture = Experiment.create!(name: "Plant Infestation", objective: "Radiation duration in plants", num_months: 36)
    @atomic = Experiment.create!(name: "Atomic Radiation", objective: "Test strength of atomic radiation", num_months: 48)
    @nuclear = Experiment.create!(name: "Nuclear Radiation", objective: "Test half-life of nuclear radiation", num_months: 60)
    @curie.experiments << @horticulture
    @curie.experiments << @atomic
    @curie.experiments << @nuclear
  end

  it "displays a scientist's name, specialty, and university" do 
    visit scientist_path(@curie.id)

    expect(page).to have_content("Marie Curie")
    expect(page).to have_content("Specialty: Radiology")
    expect(page).to have_content("University: University of Paris")
    expect(page).to have_content("Lab: Radion Labs")
    expect(page).to have_content("Experiments: Plant Infestation, Atomic Radiation, Nuclear Radiation")
  end
end 