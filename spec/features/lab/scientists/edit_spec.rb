require "rails_helper"

RSpec.describe "scientist show page",type: :feature do
    before(:each) do
        @lab = Lab.create(name: "Polis")
        @scientist = @lab.scientists.create(name: "Waltuh", specialty: "Crystals", university: "Highschool")
        @experiment_1 = Experiment.create(name: "experiment_1", objective: "rngi", num_months: 3)
        @experiment_2 = Experiment.create(name: "experiment_2", objective: "rngi", num_months: 3)
        ScientistExperiment.create!(scientist: @scientist, experiment: @experiment_1)
        ScientistExperiment.create!(scientist: @scientist, experiment: @experiment_2)
        @other_scientist = @lab.scientists.create(name: "Jesse", specialty: "Crystals", university: "Highschool")
        ScientistExperiment.create!(scientist: @other_scientist, experiment: @experiment_1)
    end

    it "User Story 2, Remove an Experiment from a Scientist" do
        # When I visit a scientist's show page
        visit "/labs/#{@lab.id}/scientists/#{@scientist.id}"
        # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
        within "#experiment-#{@experiment_1.id}" do
            expect(page).to have_button("Remove")
        end
        within "#experiment-#{@experiment_2.id}" do
            expect(page).to have_button("Remove")
        end
        # When I click that button for one experiment
        within "#experiment-#{@experiment_1.id}" do
            click_on("Remove")
        end
        # I'm brought back to the scientist's show page
        expect(page).to have_current_path("/labs/#{@lab.id}/scientists/#{@scientist.id}")
        # And I no longer see that experiment's name listed
        expect(page).to_not have_content("experiment_1")
        expect(page).to have_content("experiment_2")
        # And when I visit a different scientist's show page that is working on that same experiment,
        visit "/labs/#{@lab.id}/scientists/#{@other_scientist.id}"
        # Then I see that the experiment is still on the other scientist's work load
        expect(page).to have_content("experiment_1")
    end
end