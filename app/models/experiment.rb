class Experiment < ApplicationRecord 
  has_many :scientist_experiments 
  has_many :scientists, through: :scientist_experiments

  def self.ordered_by_length 
    self.where("experiments.num_months > ?", 6)
      .order("experiments.num_months DESC")
  end

end