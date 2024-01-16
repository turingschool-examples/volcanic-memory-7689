require 'rails_helper'

RSpec.describe 'scientist show', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @lab_1 = Lab.create!(name: "labby")

      @sci_1 = @lab_1.scientists.create!(name: "Larry", specialty: "Cancer", university: "UOM")
      @sci_2 = @lab_1.scientists.create!(name: "Logan", specialty: "Vaccines", university: "UOW")

      @exper_1 = Experiment.create!(name: "Vaccine Testing", objective: "Dev Vaccines", num_months: 4)

      @se_1 = ScientistExperiment.create!(experiment_id: @exper_1.id, scientist_id: @sci_1.id)
      @se_2 = ScientistExperiment.create!(experiment_id: @exper_1.id, scientist_id: @sci_2.id)
    end

    # User Story 1, Scientist Show Page
    it 'shows all the scientist information' do
      # When I visit a scientist's show page
      visit scientist_path(@sci_1)
      # I see all of that scientist's information including:
    #   - name
    #   - specialty
    #   - university where they got their degree
    #  And I see the name of the lab where this scientist works
    #  And I see the names of all of the experiments this scientist is running
      expect(page).to have_content(@sci_1.name)
      expect(page).to have_content(@sci_1.specialty)
      expect(page).to have_content(@sci_1.university)
      expect(page).to have_content(@sci_1.lab.name)
      expect(page).to have_content(@sci_1.experiments.first.name)
    end

    # User Story 2, Remove an Experiment from a Scientist
    it "can remove an experiment from scientists work load" do 
      # When I visit a scientist's show page
      visit scientist_path(@sci_1)
      # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
      expect(page).to have_button("Remove experiment from work load")
      # When I click that button for one experiment
      click_button("Remove experiment from work load")
      # I'm brought back to the scientist's show page
      visit scientist_path(@sci_1)
      # And I no longer see that experiment's name listed
      expect(page).to_not have_content("Vaccine Testing")
      # And when I visit a different scientist's show page that is working on that same experiment,
      visit scientist_path(@sci_2)
      # Then I see that the experiment is still on the other scientist's work load
      expect(page).to have_content(@sci_2.experiments.first.name)
    end
  end
end