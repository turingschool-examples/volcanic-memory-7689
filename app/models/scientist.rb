class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments

  def find_it(exp_id, sci_id)
    ScientistExperiment.where("experiment_id = #{exp_id}").where("scientist_id = #{sci_id}")
  end

  def count_exp
    experiments.count
  end
end