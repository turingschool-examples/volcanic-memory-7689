class Lab < ApplicationRecord
  has_many :scientists
  has_many :scientist_experiments, through: :scientists
  has_many :experiments, through: :scientist_experiments

  def long_running_experiments
    experiments
      .where("num_months > 6")
      .order(num_months: :DESC)
  end
end