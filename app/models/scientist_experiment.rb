class ScientistExperiment < ApplicationRecord
  belongs_to :scientist
  belongs_to :experiment


  def find_it(exp_id, sci_id)
    ScientistExperiment.where("experiment_id = exp_id").where("scientist_id = sci_id")

  end

end