require 'rails_helper'

RSpec.describe Experiment do
  before(:each) do
    @experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "Time Pod", objective: "create a time traveling machine", num_months: 1)
    @experiment_3 = Experiment.create!(name: "Apple Pod", objective: "create a time traveling machine", num_months: 7)
    @experiment_4 = Experiment.create!(name: "Cookie Pod", objective: "create a time traveling machine", num_months: 15)
    @experiment_5 = Experiment.create!(name: "Bread Pod", objective: "create a time traveling machine", num_months: 9)
    @experiment_6 = Experiment.create!(name: "Pie Pod", objective: "create a time traveling machine", num_months: 16)
  end

  describe "relationships" do
    it {should have_many :scientist_experiments}
    it {should have_many(:scientists).through(:scientist_experiments)}
  end

  describe "class methods" do
    describe "::long_running_experiments" do
      it "returns experiments that have been running longer than 6 months, longest to shortest" do
        expect(Experiment.long_running_experiments).to eq([@experiment_6, @experiment_4, @experiment_5, @experiment_3])
      end
    end
  end
end
