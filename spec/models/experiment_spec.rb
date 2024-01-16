require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "associations" do 
    it { should have_many :scientist_experiments }
    it { should have_many(:scientists).through(:scientist_experiments) }
  end

 it "methods" do 
    lab_1 = Lab.create!(name: "labby")

    sci_1 = lab_1.scientists.create!(name: "Larry", specialty: "Cancer", university: "UOM")
    sci_2 = lab_1.scientists.create!(name: "Logan", specialty: "Vaccines", university: "UOW")

    exper_1 = Experiment.create!(name: "Vaccine Testing", objective: "Dev Vaccines", num_months: 7)
    exper_2 = Experiment.create!(name: "UNI vs Bootcamp", objective: "Studies employement status of uni vs bootcamp grads", num_months: 12)
    exper_3 = Experiment.create!(name: "Effects of Spice", objective: "Long term effects of spice on the mind", num_months: 4)

    se_1 = ScientistExperiment.create!(experiment_id: exper_1.id, scientist_id: sci_1.id)
    se_2 = ScientistExperiment.create!(experiment_id: exper_1.id, scientist_id: sci_2.id)

    expect(Experiment.longer_than_six).to eq([exper_2, exper_1])
    expect(Experiment.longer_than_six).to_not include(exper_3)
 end
end
