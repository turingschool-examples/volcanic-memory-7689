require "rails_helper"

describe "User Story 1: Scientist Show Page" do
    # As a visitor
    # When I visit a scientist's show page
    # I see all of that scientist's information including:

    # name
    # specialty
    # university where they got their degree
    # And I see the name of the lab where this scientist works
    # And I see the names of all of the experiments this scientist is running
    
    before :each do
        @lab_1 = Lab.create!(name: "Spencer Mansion")
        @lab_2 = Lab.create!(name: "Raccoon City Underground")

        @scientist_1 = @lab_1.scientists.create!(name: "Albert Wesker", specialty: "Bio-engineering", university: "Oxford")
        @scientist_2 = @lab_1.scientists.create!(name: "William Birkin", specialty: "Epidemiology", university: "Johns Hopkins")
        @scientist_3 = @lab_2.scientists.create!(name: "Annette Birkin", specialty: "Virology", university: "Johns Hopkins")

        @experiment_1 = @scientist_1.experiments.create!(name: "T Virus", objective: "Create a self-propagating, bloodborne virus that transforms the hosts into durable bio-weapons.", num_months: 18)
        @experiment_2 = @scientist_2.experiments.create!(name: "G Virus", objective: "Create a retrovirus that transforms hosts into bio-weapons with greater combat capability than T Virus hosts.", num_months: 24)
    end

    it "shows all the scientist's attributes: name, specialty, university, lab name, and experiment names" do
        # Scientist_1 attributes
        visit lab_scientist_path(@lab_1, @scientist_1)

        expect(page).to have_content(@scientist_1.name)
        expect(page).to have_content(@scientist_1.specialty)
        expect(page).to have_content(@scientist_1.university)
        expect(page).to have_content(@lab_1.name)
        expect(page).to have_content(@experiment_1.name)

        expect(page).to_not have_content(@lab_2.name)
        expect(page).to_not have_content(@scientist_2.name)
        expect(page).to_not have_content(@experiment_2.name)

        # Scientist_2 attributes
        visit lab_scientist_path(@lab_1, @scientist_2)

        expect(page).to have_content(@scientist_2.name)
        expect(page).to have_content(@scientist_2.specialty)
        expect(page).to have_content(@scientist_2.university)
        expect(page).to have_content(@lab_1.name)
        expect(page).to have_content(@experiment_2.name)

        expect(page).to_not have_content(@lab_2.name)
        expect(page).to_not have_content(@scientist_1.name)
        expect(page).to_not have_content(@experiment_1.name)
        
        # Scientist_3 attributes
        visit lab_scientist_path(@lab_2, @scientist_3)

        expect(page).to have_content(@scientist_3.name)
        expect(page).to have_content(@scientist_3.specialty)
        expect(page).to have_content(@scientist_3.university)
        expect(page).to have_content(@lab_2.name)
        expect(page).to have_content("#{@scientist_3.name} is not conducting any experiments")

        expect(page).to_not have_content(@lab_1.name)
        expect(page).to_not have_content(@scientist_2.name)
        expect(page).to_not have_content(@experiment_2.name)
    end
end

describe "User Story 2: Remove an Experiment from a Scientist" do
    # As a visitor
    # When I visit a scientist's show page
    # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
    # When I click that button for one experiment
    # I'm brought back to the scientist's show page
    # And I no longer see that experiment's name listed
    # And when I visit a different scientist's show page that is working on that same experiment,
    # Then I see that the experiment is still on the other scientist's work load

    before :each do
        @lab_1 = Lab.create!(name: "Spencer Mansion")
        @lab_2 = Lab.create!(name: "Raccoon City Underground")

        @scientist_1 = @lab_1.scientists.create!(name: "Albert Wesker", specialty: "Bio-engineering", university: "Oxford")
        @scientist_2 = @lab_1.scientists.create!(name: "William Birkin", specialty: "Epidemiology", university: "Johns Hopkins")
        @scientist_3 = @lab_2.scientists.create!(name: "Annette Birkin", specialty: "Virology", university: "Johns Hopkins")

        @experiment_1 = @scientist_1.experiments.create!(name: "T Virus", objective: "Create a self-propagating, bloodborne virus that transforms the hosts into durable bio-weapons.", num_months: 18)
        @experiment_2 = @scientist_2.experiments.create!(name: "G Virus", objective: "Create a retrovirus that transforms hosts into bio-weapons with greater combat capability than T Virus hosts.", num_months: 24)
    end

    it "has a button that removes an experiment from a scientist, without removing the experiment from other scientists" do
        # Add @scientist_2 to @experiment_1
        ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_1.id)

        # Verify experiment removal for @scientist_1
        visit lab_scientist_path(@lab_1, @scientist_1)
        
        expect(page).to have_content(@experiment_1.name)

        save_and_open_page
        expect(page).to have_button("Remove Experiment")
        click_button "Remove Experiment"
        save_and_open_page

        expect(current_path).to eq(lab_scientist_path(@lab_1, @scientist_1))
        expect(page).to_not have_content(@experiment_1.name)

        # Verify experiment remains for @scientist_2
        visit lab_scientist_path(@lab_1, @scientist_2)
        
        save_and_open_page
        expect(page).to have_content(@experiment_1.name)
        expect(page).to have_button("Remove Experiment")
    end
end

