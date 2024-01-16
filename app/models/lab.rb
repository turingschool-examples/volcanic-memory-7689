class Lab < ApplicationRecord
  has_many :scientists
  has_many :experiments_scientists, through: :scientists
  has_many :experiments, through: :experiments_scientists
end