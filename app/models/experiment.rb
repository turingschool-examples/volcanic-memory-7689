class Experiment < ApplicationRecord
  # many to many with Scientists
  has_and_belongs_to_many :scientists

  def self.long_running_experiments
    where("num_months > ?", 6)
      .order(num_months: :desc)
  end
end