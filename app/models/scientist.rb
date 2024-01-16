class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments 
  has_many :experiments, through: :scientist_experiments

  def self.display_staff
    self.select("scientists.name, COUNT(experiments.id) AS exp_count").distinct.joins(:experiments).group("scientists.id").order("exp_count DESC")
  end
end