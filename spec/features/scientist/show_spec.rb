require 'rails_helper'

RSpec.describe Scientist do
  describe "show" do
    before :each do
      @lab1 = Lab.create(name: "Bletchley Park")
      @scientist1 = @lab1.scientists.create(name: "Alan Turing", specialty: "cryptanalysis", university: "University of Cambridge")
      @experiment1 = @scientist1.experiements.create!(name: "Ultra", objective: "cracking Enigma", num_months: 6)
      @experiment2 = @scientist1.experiements.create!(name: "Imitation Game", objective: "intelligent machinery", num_months: 4)
    end

  it "displays all required information on the Scientist show page."
    visit scientist_path(@scientist1)

    expect(page).to have_content("Alan Turing")
    expect(page).to have_content("cryptanalysis")
    expect(page).to have_content("University of Cambridge")
    expect(page).to have_content("Bletchley Park")
    expect(page).to have_content("Ultra")
    expect(page).to have_content("Imitation Game")
  end
end

