class Experiment < ApplicationRecord
  belongs_to :scientist
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments
end