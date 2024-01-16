require 'rails_helper'

RSpec.describe 'scientist show', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @lab_1 = Lab.create!(name: "labby")

      @sci_1 = @lab_1.scientists.create!(name: "Larry", specialty: "cancer", university: "UOM")

      @exper_1 = Experiment.create!(name: "vaccines", objective: "dev vaccines", num_months: 4)

      @se_1 = ScientistExperiment.create!(experiment_id: @exper_1.id, scientist_id: @sci_1.id)
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
  end
end