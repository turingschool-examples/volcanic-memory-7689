require "rails_helper"

RSpec.describe "Scientist Show Page" do

  it "shows a scientist information" do 
    lab = Lab.create(name: 'Lab Name')
    scientist = Scientist.create(name: 'Scientist Name', specialty: 'Specialty', university: 'University', lab: lab)
    experiment1 = Experiment.create(name: 'Experiment Name 1', objective: 'Experiment Objective 1', num_months: 3, scientist: scientist)
    experiment2 = Experiment.create(name: 'Experiment Name 2', objective: 'Experiment Objective 2', num_months: 4, scientist: scientist)

    scientist.experiments << [experiment1, experiment2]

    visit scientist_path(scientist)

    expect(page).to have_content(scientist.name)
    expect(page).to have_content(scientist.specialty)
    expect(page).to have_content(scientist.university)
    expect(page).to have_content(lab.name)
    
    # save_and_open_page
    expect(page).to have_content(experiment1.name)
    expect(page).to have_content(experiment2.name)
  end

  it "removes an experiment from a scientist" do 

    lab = Lab.create(name: 'Lab Name')
    scientist = Scientist.create(name: 'Scientist Name', specialty: 'Specialty', university: 'University', lab: lab)
    experiment1 = Experiment.create(name: 'Experiment Name 1', objective: 'Experiment Objective 1', num_months: 3, scientist: scientist)
    experiment2 = Experiment.create(name: 'Experiment Name 2', objective: 'Experiment Objective 2', num_months: 4, scientist: scientist)
    scientist.experiments << [experiment1, experiment2]

    visit scientist_path(scientist)

    expect(page).to have_content(experiment1.name)
    expect(page).to have_content(experiment2.name)

    within("#experiment_#{experiment1.id}") do
      click_button 'Remove'
    end

    expect(current_path).to eq(scientist_path(scientist))
    expect(page).not_to have_content(experiment1.name)
    expect(page).to have_content(experiment2.name)
  end
end 