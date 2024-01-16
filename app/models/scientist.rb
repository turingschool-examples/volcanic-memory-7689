class Scientist < ApplicationRecord
  belongs_to :lab
  # many to many with Experiments
  has_and_belongs_to_many :experiments

  def remove_experiment(experiment_id)
    experiments.destroy(experiment_id)
  end

end