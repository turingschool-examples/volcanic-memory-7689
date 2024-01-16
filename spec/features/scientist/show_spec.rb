require "rails_helper"

RSpec.describe "Scientist Show Page" do
  it "shows a scientist information" do 
    lab = Lab.create(name: 'Lab Name')
    scientist = Scientist.create(name: 'Scientist Name', specialty: 'Specialty', university: 'University',lab: lab)
    experiment1 = Experiment.create(name: 'Experiment Name 1', objective: 'Experiment Objective 1', num_months: 3, scientist_id: scientist.id)
    experiment2 = Experiment.create(name: 'Experiment Name 2', objective: 'Experiment Objective 2',num_months: 4,scientist_id: scientist.id)
   
    visit scientist_path(scientist)

    expect(page).to have_content(scientist.name)
    expect(page).to have_content(scientist.specialty)
    expect(page).to have_content(scientist.university)
    expect(page).to have_content(lab.name)
    expect(page).to have_content(experiment1.name)
    expect(page).to have_content(experiment2.name)

  end
  
end