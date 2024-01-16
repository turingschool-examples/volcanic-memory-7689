class Experiment < ApplicationRecord
  validates_presence_of :name,
                        :objective,
                        :num_months

  has_many :scientist_experiments, dependent: :destroy
  has_many :scientists, through: :scientist_experiments
end
