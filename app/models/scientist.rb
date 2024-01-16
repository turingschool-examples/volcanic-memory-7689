class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments

  def find_scientist_experiment_id(experiment_name)
    @experiment = Experiment.find_by(name: experiment_name)
    # @scientist_experiment_id = ScientistExperiment.where(experiment_id: experiment.id, scientist_id: id).pluck(:id).first
    
    @scientist_experiment_id = ScientistExperiment.find_by(experiment_id: @experiment.id, scientist_id: id).id
    # binding.pry
  end

  def active_scientist_experiment_names
    Experiment.joins(:scientist_experiments).where(scientist_experiments: { scientist_id: id, active: true }).pluck(:name)
  end
end