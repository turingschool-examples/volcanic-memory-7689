class Experiment < ApplicationRecord
  belongs_to :scientist
  belongs_to :lab
end
