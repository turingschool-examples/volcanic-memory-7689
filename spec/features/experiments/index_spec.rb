require "rails_helper"

RSpec.describe "experiment index page",type: :feature do
    before(:each) do
        @experiment_1 = Experiment.create(name: "Apples", objective: "rngi", num_months: 11)
        @experiment_5 = Experiment.create(name: "Eggs", objective: "rngi", num_months: 7)
        @experiment_2 = Experiment.create(name: "Bananas", objective: "rngi", num_months: 10)
        @experiment_3 = Experiment.create(name: "Cherries", objective: "rngi", num_months: 9)
        @experiment_4 = Experiment.create(name: "Donuts", objective: "rngi", num_months: 8)
        @experiment_6 = Experiment.create(name: "Frogs", objective: "rngi", num_months: 3)
    end

    it "User Story 3, Experiment Index Page" do
        # When I visit the experiment index page
        visit "/experiments"
        # I see the names of all long running experiments (longer than 6 months),
        expect(page).to_not have_content("Frogs")
        expect(page).to have_content("Apples")
        expect(page).to have_content("Bananas")
        expect(page).to have_content("Cherries")
        expect(page).to have_content("Donuts")
        expect(page).to have_content("Eggs")
        # And I see the names are in descending order (longest to shortest)
        expect("Apples").to appear_before("Bananas")
        expect("Bananas").to appear_before("Cherries")
        expect("Cherries").to appear_before("Donuts")
        expect("Donuts").to appear_before("Eggs")
    end
end