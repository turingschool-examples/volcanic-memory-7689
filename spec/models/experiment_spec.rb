require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "relationships" do
    it { should have_many(:scientist_experiments) }
    it { should have_many(:scientists).through(:scientist_experiments) }
    end

    describe "#long_running" do 
      it "return experiments with num_months greater than 6" do
        experiment_1=Experiment.create!(name:"Covid Research", objective:"Find a vaccine for covid virus", num_months:24)
        experiment_2=Experiment.create!(name:"Sickle Cell Research", objective:"Find a cure for sickle cell", num_months:48)
        experiment_3=Experiment.create!(name:"Population Research", objective:"Increase US population by 15%", num_months:60)
        experiment_4=Experiment.create!(name:"Flu Research", objective:"Find cure for flu", num_months:5)


        lab1 = Lab.create!(name:"Dream Lab")
    
        scientist_1=lab1.scientists.create!(name:"Hawking",specialty:"Physics",university:"University of Richmond")
        scientist_2=lab1.scientists.create!(name:"Einstein",specialty:"Chemistry", university:"University of Brooklyn")
        scientist_3=lab1.scientists.create!(name:"Juliet",specialty:"Engineering", university:"University of Turing")

        ScientistExperiment.create!(scientist_id:scientist_1.id, experiment_id:experiment_1.id)
        ScientistExperiment.create!(scientist_id:scientist_1.id,experiment_id:experiment_2.id)
        ScientistExperiment.create!(scientist_id:scientist_2.id,experiment_id:experiment_3.id)
        ScientistExperiment.create!(scientist_id:scientist_3.id,experiment_id:experiment_3.id)
        expect(Experiment.long_running).to eq([experiment_1.name,experiment_2.name,experiment_3.name])
      end
    end
end
