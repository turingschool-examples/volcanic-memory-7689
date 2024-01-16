require 'rails_helper'

RSpec.describe Scientist, type: :model do
  it {should belong_to :lab}
  it {should have_and_belong_to_many :experiments}

  describe "delete experiment" do
    before :each do
      @lab1 = Lab.create(name: "Bletchley Park")
      @scientist1 = @lab1.scientists.create(name: "Alan Turing", specialty: "cryptanalysis", university: "University of Cambridge")
      @experiment1 = @scientist1.experiments.create!(name: "Ultra", objective: "cracking Enigma", num_months: 6)
      @experiment2 = @scientist1.experiments.create!(name: "Imitation Game", objective: "intelligent machinery", num_months: 4)
    end

    it "removes the experiment from the scientist" do
      @scientist1.remove_experiment(@experiment1.id)
      
      expect(@scientist1.experiments).not_to include(@experiment1)
      expect(@scientist1.experiments).to include(@experiment2)
    end
  end
end