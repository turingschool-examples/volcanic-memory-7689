class Scientist < ApplicationRecord
  belongs_to :lab
  # many to many with Experiments
  has_and_belongs_to_many :experiments

end