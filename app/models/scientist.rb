class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :experiments_scientists
  has_many :experiments, through: :experiments_scientists
end