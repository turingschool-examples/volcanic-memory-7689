require 'rails_helper'


RSpec.describe Experiment, type: :feature do
  describe "index" do
    before :each do
      @lab1 = Lab.create(name: "Bletchley Park")
      @scientist1 = @lab1.scientists.create(name: "Alan Turing", specialty: "cryptanalysis", university: "University of Cambridge")

      @experiment1 = @scientist1.experiments.create!(name: "Ultra", objective: "cracking Enigma", num_months: 6)
      @experiment2 = @scientist1.experiments.create!(name: "Imitation Game", objective: "intelligent machinery", num_months: 7)
      @experiment3 = @scientist1.experiments.create!(name: "Turing Test", objective: "intelligent machinery", num_months: 8)
      @experiment3 = @scientist1.experiments.create!(name: "Chess", objective: "find best chess player at Cambridge", num_months: 5)

      visit experiments_path
    end

    it "show experiments > 6 months in decending order" do

      expect("Turing Test").to appear_before("Imitation Game")
      expect(page).not_to have_content("Ultra")
      expect(page).not_to have_content("Chess")
    end
  end
end