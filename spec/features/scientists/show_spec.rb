# User Story 1, Scientist Show Page

require 'rails_helper'
RSpec.describe "Scientist Show Page" do 
  it "shows all of that scientists name, specialty, university" do 
   
    experiment_1=Experiment.create!(name:"Covid Research", objective:"Find a vaccine for covid virus", num_months:24)
    experiment_2=Experiment.create!(name:"Sickle Cell Research", objective:"Find a cure for sickle cell", num_months:48)
    experiment_3=Experiment.create!(name:"Population Reasearch", objective:"Increase US population by 15%", num_months:60)

    lab1 = Lab.create!(name:"Dream Lab")
    
    scientist_1=lab1.scientists.create!(name:"Hawking",specialty:"Physics",university:"University of Richmond")
    scientist_2=lab1.scientists.create!(name:"Einstein",specialty:"Chemistry", university:"University of Brooklyn")
    scientist_3=lab1.scientists.create!(name:"Juliet",specialty:"Engineering", university:"University of Turing")

    ScientistExperiment.create!(scientist_id:scientist_1.id, experiment_id:experiment_1.id)
    ScientistExperiment.create!(scientist_id:scientist_1.id,experiment_id:experiment_2.id)
    ScientistExperiment.create!(scientist_id:scientist_2.id,experiment_id:experiment_3.id)
    
    # As a visitor
    # When I visit a scientist's show page
    
    visit "/scientists/#{scientist_1.id}"
    within("#scientist-#{scientist_1.id}") do 

    # I see all of that scientist's information including:
    #  - name
    #  - specialty
    #  - university where they got their degree
    expect(page).to have_content(scientist_1.name)
    expect(page).to have_content(scientist_1.specialty)
    expect(page).to have_content(scientist_1.university)
    
    # And I see the name of the lab where this scientist works
    expect(page).to have_content(scientist_1.lab.name)
    # And I see the names of all of the experiments this scientist is running
    expect(page).to have_content("Covid Research")
    expect(page).to have_content("Sickle Cell Research")

    expect(page).to_not have_content(scientist_2.name)
    expect(page).to_not have_content(scientist_2.specialty)
    expect(page).to_not have_content(scientist_2.university)
    
    expect(page).to_not have_content("Population Research")

    end
  end
end




