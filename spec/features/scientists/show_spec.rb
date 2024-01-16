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
        @lab_1 = Lab.create(name: "Spencer Mansion")
        @lab_2 = Lab.create(name: "Raccoon City Underground")

        @scientist_1 = @lab_1.scientists.create(name: "Albert Wesker", specialty: "Bio-engineering", university: "Oxford")
        @scientist_2 = @lab_1.scientists.create(name: "William Birkin", specialty: "Epidemiology", university: "Johns Hopkins")
        @scientist_3 = @lab_2.scientists.create(name: "Annette Birkin", specialty: "Virology", university: "Johns Hopkins")

        @experiment_1 = @scientist_1.experiments.create(name: "T Virus", objective: "Create a self-propagating, bloodborne virus that transforms the hosts into durable bio-weapons.", num_months: 18)
        @experiment_2 = @scientist_2.experiments.create(name: "G Virus", objective: "Create a retrovirus that transforms hosts into bio-weapons with greater combat capability than T Virus hosts.", num_months: 24)
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
