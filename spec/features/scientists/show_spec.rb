require "rails_helper" 

RSpec.describe "scientist show page", type: :feature do
  before(:each) do 
    @radion = Lab.create!(name: "Radion Labs")
    @curie = Scientist.create!(name: "Marie Curie", specialty: "Radiology", university: "University of Paris", lab_id: @radion.id)
    @einstein = Scientist.create!(name: "Albert Einstein", specialty: "Nuclear Physics", university: "German Institute of Technology", lab_id: @radion.id)
    @horticulture = Experiment.create!(name: "Plant Infestation", objective: "Radiation duration in plants", num_months: 36)
    @atomic = Experiment.create!(name: "Atomic Radiation", objective: "Test strength of atomic radiation", num_months: 48)
    @nuclear = Experiment.create!(name: "Nuclear Radiation", objective: "Test half-life of nuclear radiation", num_months: 60)
    @curie.experiments << @horticulture
    @curie.experiments << @atomic
    @curie.experiments << @nuclear
    @einstein.experiments << @atomic
    @einstein.experiments << @nuclear
  end

  it "displays a scientist's name, specialty, and university" do 
    visit scientist_path(@curie.id)

    expect(page).to have_content("Marie Curie")
    expect(page).to have_content("Specialty: Radiology")
    expect(page).to have_content("University: University of Paris")
    expect(page).to have_content("Lab: Radion Labs")
    expect(page).to have_content("Plant Infestation")
    expect(page).to have_content("Atomic Radiation")
    expect(page).to have_content("Nuclear Radiation")
  end

  describe "removing an experiment from a scientist" do 
    it "next to each experiment's name is a button to remove the experiment from the scientist's workload" do 
      visit scientist_path(@curie.id)
  
      within "##{@horticulture.id}" do
        expect(page).to have_content("Plant Infestation")
        expect(page).to have_button("Remove")
      end

      within "##{@atomic.id}" do
        expect(page).to have_content("Atomic Radiation")
        expect(page).to have_button("Remove")
      end

      within "##{@nuclear.id}" do
        expect(page).to have_content("Nuclear Radiation")
        expect(page).to have_button("Remove")
      end
    end

    it "when the 'Remove' button next to an experiment is clicked, that experiment is removed from the scientist's workload" do 
      visit scientist_path(@curie.id)

      within ".experiment-list" do 
        expect(page).to have_content("Plant Infestation")
        expect(page).to have_content("Atomic Radiation")
        expect(page).to have_content("Nuclear Radiation")
      end
      
      within "##{@atomic.id}" do 
        click_button "Remove"
      end

      expect(current_path).to eq(scientist_path(@curie.id))

      expect(page).to_not have_content("Atomic Radiation")
      expect(page).to have_content("Plant Infestation")
      expect(page).to have_content("Nuclear Radiation")

      # When I visit a different scientist's show page that is working on the same experiment, that experiement is still listed with the scientist even after it has been removed from a different scientist's workload

      visit scientist_path(@einstein.id)

      within ".experiment-list" do 
        expect(page).to have_content("Atomic Radiation")
        expect(page).to have_content("Nuclear Radiation")
      end
    end
  end
end