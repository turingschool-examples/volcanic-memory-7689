# User Story 3, Experiment Index Page
require 'rails_helper'
RSpec.describe "Experiment Index Page" do 

  it "shows all of that scientists name, specialty, university" do 
   
    experiment_1=Experiment.create!(name:"Covid Research", objective:"Find a vaccine for covid virus", num_months:24)
    experiment_2=Experiment.create!(name:"Sickle Cell Research", objective:"Find a cure for sickle cell", num_months:48)
    experiment_3=Experiment.create!(name:"Population Research", objective:"Increase US population by 15%", num_months:60)

    lab1 = Lab.create!(name:"Dream Lab")
    
    scientist_1=lab1.scientists.create!(name:"Hawking",specialty:"Physics",university:"University of Richmond")
    scientist_2=lab1.scientists.create!(name:"Einstein",specialty:"Chemistry", university:"University of Brooklyn")
    scientist_3=lab1.scientists.create!(name:"Juliet",specialty:"Engineering", university:"University of Turing")

    ScientistExperiment.create!(scientist_id:scientist_1.id, experiment_id:experiment_1.id)
    ScientistExperiment.create!(scientist_id:scientist_1.id,experiment_id:experiment_2.id)
    ScientistExperiment.create!(scientist_id:scientist_2.id,experiment_id:experiment_3.id)
    ScientistExperiment.create!(scientist_id:scientist_3.id,experiment_id:experiment_3.id)

    
    # As a visitor
    # When I visit a scientist's show page
    
    visit "/experiments/"
    within("#experiment-#{experiment_1.id}") do
      #I see the names of all long running experiments (longer than 6 months),

      expect(page).to have_content("Covid Research")
      #expect(page).to_not have_content("Sickle Cell Research")
    end 

    visit "/experiments/"
    within("#experiment-#{experiment_2.id}") do
      #I see the names of all long running experiments (longer than 6 months),
      expect(page).to have_content("Sickle Cell Research")
      #expect(page).to_not have_content("Covid Research")
    end 

    visit "/experiments/"
    within("#experiment-#{experiment_3.id}") do
      #I see the names of all long running experiments (longer than 6 months),
      expect(page).to have_content("Population Research")
      #expect(page).to_not have_content("Covid Research")
    end
  end
end