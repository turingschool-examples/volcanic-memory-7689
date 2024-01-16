class Experiment < ApplicationRecord
  has_many :scientist_experiments 
  has_many :scientists, through: :scientist_experiments
  def self.long_running
    Experiment.where("num_months > 6")
  end
end
