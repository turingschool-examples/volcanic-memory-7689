require "rails_helper"

RSpec.describe "experiments index", type: :feature do
  it "lists all experiments over 6 months long, and their names in order of longest to shortest" do
    lab1 = Lab.create!(name: "Eco Lab")
    scientist1 = lab1.scientists.create!(name: "Bruno Marfa", specialty: "Ecology", university: "University of Michigan")
    experiment1 = scientist1.experiments.create!(name: "Nocturnal Amphibian Behavior", objective: "Studies the behavior of nocturnal amphibians in relation to light pollution", num_months: 12)
    experiment2 = scientist1.experiments.create!(name: "Bat Population", objective: "Studies the bat population in relation to light pollution", num_months: 9)
    experiment3 = scientist1.experiments.create!(name: "Acid Rain", objective: "Studies the acid rain in relation to industrialization", num_months: 6)
    scientist2 = lab1.scientists.create!(name: "Sonja Brumfield", specialty: "Ecology", university: "University of Michigan")
    experiment4 = scientist2.experiments.create!(name: "Rat Maze", objective: "Studies the intelligence of Rats", num_months: 3)
    experiment5 = scientist2.experiments.create!(name: "Molecular Lab Test", objective: "Studies the smallest bits", num_months: 7)
    experiment6 = scientist2.experiments.create!(name: "Lake Particulates", objective: "Studies lake pollutants", num_months: 60)

    visit "/experiments"

    expect(page).to have_content("Nocturnal Amphibian Behavior")
    expect(page).to have_content("Bat Population")
    expect(page).not_to have_content("Acid Rain")
    expect(page).not_to have_content("Rat Maze")
    expect(page).to have_content("Molecular Lab Test")
    expect(page).to have_content("Lake Particulates")

    expect("Lake Particulates").to appear_before("Nocturnal Amphibian Behavior")
    expect("Lake Particulates").to appear_before("Molecular Lab Test")
    expect("Nocturnal Amphibian Behavior").to appear_before("Bat Population")
  end
end
