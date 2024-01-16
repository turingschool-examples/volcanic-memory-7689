class Experiment < ApplicationRecord
  # many to many with Scientists
  has_and_belongs_to_many :scientists

end