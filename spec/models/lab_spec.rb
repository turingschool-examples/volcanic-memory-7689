require 'rails_helper'

RSpec.describe Lab do
  it {should have_many :scientists}
  it {should have_many(:scientist_experiments).through(:scientists)}
  it {should have_many(:experiments).through(:scientist_experiments)}

  describe "instance methods" do
    before :each do
      @lab_1 = Lab.create!(name: "Spencer Mansion")
      @lab_2 = Lab.create!(name: "Raccoon City Underground")
  
      @scientist_1 = @lab_1.scientists.create!(name: "Albert Wesker", specialty: "Bio-engineering", university: "Oxford")
      @scientist_2 = @lab_1.scientists.create!(name: "William Birkin", specialty: "Epidemiology", university: "Johns Hopkins")
      @scientist_3 = @lab_2.scientists.create!(name: "Annette Birkin", specialty: "Virology", university: "Johns Hopkins")
  
      @experiment_1 = @scientist_1.experiments.create!(name: "T Virus", objective: "Create a self-propagating, bloodborne virus that transforms the hosts into durable bio-weapons.", num_months: 18)
      @experiment_2 = @scientist_2.experiments.create!(name: "G Virus", objective: "Create a retrovirus that transforms hosts into bio-weapons with greater combat capability than T Virus hosts.", num_months: 24)
      @experiment_3 = @scientist_1.experiments.create!(name: "T-Veronica Virus", objective: "Create a virus that morphs host psychology to resemble an ant colony.", num_months: 5)
      @experiment_4 = @scientist_2.experiments.create!(name: "Las Plagas Parasite", objective: "Create a parasite that retains basic host intelligence.", num_months: 23)
    end

    it "long_running_experiments (User Story 3: experiment index page)" do
      # As a visitor
      # When I visit the experiment index page
      # I see the names of all long running experiments (longer than 6 months),
      # And I see the names are in descending order (longest to shortest)

      expect(@lab_1.long_running_experiments).to eq([@experiment_2, @experiment_4, @experiment_1])
    end
  end
  
end