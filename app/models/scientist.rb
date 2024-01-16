class Scientist < ApplicationRecord
  validates_presence_of :name,
                        :specialty,
                        :university

  belongs_to :lab
  has_many :scientist_experiments, dependent: :destroy
  has_many :experiments, through: :scientist_experiments

end