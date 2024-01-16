require 'rails_helper'

RSpec.describe 'experiment index', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @lab_1 = Lab.create!(name: "labby")

      @sci_1 = @lab_1.scientists.create!(name: "Larry", specialty: "Cancer", university: "UOM")
      @sci_2 = @lab_1.scientists.create!(name: "Logan", specialty: "Vaccines", university: "UOW")

      @exper_1 = Experiment.create!(name: "Vaccine Testing", objective: "Dev Vaccines", num_months: 7)
      @exper_2 = Experiment.create!(name: "UNI vs Bootcamp", objective: "Studies employement status of uni vs bootcamp grads", num_months: 12)
      @exper_3 = Experiment.create!(name: "Effects of Spice", objective: "Long term effects of spice on the mind", num_months: 4)

      @se_1 = ScientistExperiment.create!(experiment_id: @exper_1.id, scientist_id: @sci_1.id)
      @se_2 = ScientistExperiment.create!(experiment_id: @exper_1.id, scientist_id: @sci_2.id)
    end

    # User Story 3, Experiment Index Page
    it 'shows experiments running longer then 6 months in dcending order by length' do
      # When I visit the experiment index page
      visit experiments_path
      # I see the names of all long running experiments (longer than 6 months),
      # And I see the names are in descending order (longest to shortest)
      within '.six_and_over' do
        expect(page).to have_content(@exper_2.name)
        expect(page).to have_content(@exper_1.name)
        expect(page).to_not have_content(@exper_3.name)
      end
    end
  end
end