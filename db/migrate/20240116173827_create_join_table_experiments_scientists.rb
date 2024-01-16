class CreateJoinTableExperimentsScientists < ActiveRecord::Migration[7.0]
  def change
    create_join_table :experiments, :scientists do |t|
      # t.index [:experiment_id, :scientist_id]
      # t.index [:scientist_id, :experiment_id]
    end
  end
end
