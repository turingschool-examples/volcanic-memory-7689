class Experiment < ApplicationRecord
  has_many :experiments_scientists
  has_many :scientists, through: :experiments_scientists
end
