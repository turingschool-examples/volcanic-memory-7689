require "rails_helper"

RSpec.describe "scientist show page",type: :feature do
    before(:each) do
        @lab = Lab.create(name: "Polis")
        @scientist = @lab.scientists.create(name: "Waltuh", specialty: "Crystals", university: "Highschool")
        @experiment_1 = Experiment.create(name: "experiment_1", objective: "rngi", num_months: 3)
        @experiment_2 = Experiment.create(name: "experiment_2", objective: "rngi", num_months: 3)
        ScientistExperiment.create!(scientist: @scientist, experiment: @experiment_1)
        ScientistExperiment.create!(scientist: @scientist, experiment: @experiment_2)
    end

    it "User Story 1, Scientist Show Page" do
        # When I visit a scientist's show page
        visit "/labs/#{@lab.id}/scientists/#{@scientist.id}"
        # I see all of that scientist's information including:
        # - name
        expect(page).to have_content(@scientist.name)
        # - specialty
        expect(page).to have_content(@scientist.specialty)
        # - university where they got their degree
        expect(page).to have_content(@scientist.university)
        # And I see the name of the lab where this scientist works
        expect(page).to have_content(@lab.name)
        # And I see the names of all of the experiments this scientist is running
        expect(page).to have_content(@experiment_1.name)
        expect(page).to have_content(@experiment_2.name)
    end
end