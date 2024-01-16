class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments

  def all_experiments
    Experiment.select("string_agg(experiments.name, ', ')").joins(:scientists).where("scientists.id = ?", self.id).pluck(:name).join(", ")
  end
end
