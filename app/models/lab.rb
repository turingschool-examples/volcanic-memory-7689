class Lab < ApplicationRecord
  has_many :scientists

# started to try and actually order them by number of experiments
  # def order
  #   scientists.order
  # end
end