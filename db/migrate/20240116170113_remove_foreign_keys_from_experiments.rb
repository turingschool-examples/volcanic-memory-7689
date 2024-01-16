class RemoveForeignKeysFromExperiments < ActiveRecord::Migration[7.0]
  def change
    remove_index :experiments, name: "index_experiments_on_lab_id"
    remove_index :experiments, name: "index_experiments_on_scientist_id"
    remove_foreign_key :experiments, column: :lab_id
    remove_foreign_key :experiments, column: :scientist_id
  end
end
