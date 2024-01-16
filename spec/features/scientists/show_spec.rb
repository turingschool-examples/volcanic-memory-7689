require "rails_helper"

RSpec.describe "scientist show page",type: :feature do
  it "shows scientist's details: name, specialty, university and their work lab and their experiments" do
    lab1 = Lab.create!(name: "Eco Lab")
    scientist1 = lab1.scientists.create!(name: "Bruno Marfa", specialty: "Ecology", university: "University of Michigan")
    experiment1 = scientist1.experiments.create!(name: "Nocturnal Amphibian Behavior", objective: "Studies the behavior of nocturnal amphibians in relation to light pollution", num_months: 12)
    experiment2 = scientist1.experiments.create!(name: "Bat Population", objective: "Studies the bat population in relation to light pollution", num_months: 9)
    experiment3 = scientist1.experiments.create!(name: "Acid Rain", objective: "Studies the acid rain in relation to industrialization", num_months: 6)

    visit "/labs/#{lab1.id}/scientists/#{scientist1.id}"

    expect(page).to have_content(scientist1.name)
    expect(page).to have_content(scientist1.specialty)
    expect(page).to have_content(scientist1.university)
    expect(page).to have_content(lab1.name)
    expect(page).to have_content(experiment1.name)
    expect(page).to have_content(experiment2.name)
    expect(page).to have_content(experiment3.name)
  end
end
