class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments

  # def remove_experiment(experiment_id)
  #   experiments.delete(experiment_id)
  # end
end