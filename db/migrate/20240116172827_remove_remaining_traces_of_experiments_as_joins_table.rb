class RemoveRemainingTracesOfExperimentsAsJoinsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :experiments, :scientist_id, :bigint
    remove_column :experiments, :lab_id, :bigint
  end
end
