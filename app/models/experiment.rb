class Experiment < ApplicationRecord 
  has_many :scientist_experiments 
  has_many :scientists, through: :scientists_experiments
end