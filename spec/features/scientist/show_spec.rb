require 'rails_helper'

RSpec.describe Scientist, type: :feature do
  describe "show" do
    before :each do
      @lab1 = Lab.create(name: "Bletchley Park")
      @scientist1 = @lab1.scientists.create(name: "Alan Turing", specialty: "cryptanalysis", university: "University of Cambridge")
      @experiment1 = @scientist1.experiments.create!(name: "Ultra", objective: "cracking Enigma", num_months: 6)
      @experiment2 = @scientist1.experiments.create!(name: "Imitation Game", objective: "intelligent machinery", num_months: 4)

      @scientist2 = @lab1.scientists.create(name: "Gordon Welchman", specialty: "mathematics", university: "University of Cambridge")
      @scientist3 = @lab1.scientists.create(name: "Hugh Alexander", specialty: "mathematics", university: "University of Cambridge")
      @scientist4 = @lab1.scientists.create(name: "Stuart Milner-Barry", specialty: "chess", university: "University of Cambridge")

      @experiment1.scientists << @scientist2
      @experiment1.scientists << @scientist3
      @experiment1.scientists << @scientist4
    end

    it "displays all required information on the Scientist show page" do
      visit scientist_path(@scientist1)

      expect(page).to have_content("Alan Turing")
      expect(page).to have_content("cryptanalysis")
      expect(page).to have_content("University of Cambridge")
      expect(page).to have_content("Bletchley Park")
      expect(page).to have_content("Ultra")
      expect(page).to have_content("Imitation Game")
    end

    it "removes experiment from scientist when delete button is presssed" do
      visit scientist_path(@scientist1)

      expect(page).to have_content("Ultra")
      expect(page).to have_button("Delete")

      click_button "Delete"
      expect(current_path).to eq(scientist_path(@scientist1))
      expect(page).not_to have_content("Ultra")
    end

    it "doesn't effect other scientists when an experiment is deleted from a scientist" do
      visit scientist_path(@scientist1)

      expect(page).to have_content("Ultra")
      expect(page).to have_button("Delete")

      click_button "Delete"
      expect(current_path).to eq(scientist_path(@scientist1))
      expect(page).not_to have_content("Ultra")

      visit scientist_path(@scientist2)
      expect(page).to have_content("Ultra")
      expect(page).to have_button("Delete")
    end
  end
end
