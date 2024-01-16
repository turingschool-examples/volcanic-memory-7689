require 'rails_helper'

RSpec.describe 'lab show', type: :feature do
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
      @se_3 = ScientistExperiment.create!(experiment_id: @exper_2.id, scientist_id: @sci_1.id)
    end

    # Extension, Lab Show Page
    xit 'displays labs info, scientists info, and experiments associated with that scientist' do
      # When I visit a lab's show page
      visit lab_path(@lab_1)
      # I see the lab's name
      expect(page).to have_content(@lab_1.name)
      # And I see the names of all scientists that work at this lab,
      # And next to each scientist I see the number of experiments associated with the scientist,
      # And I see the list of scientists is ordered from most number of experiments to least number of experiments
      # (Scientist experiment counts should be a single query)
      expect(page).to have_content("#{@sci_1.name} Active Experiments: 2 ") 
      expect(page).to have_content("#{@sci_2.name} Active Experiments: 1 ") 
    end
  end
end