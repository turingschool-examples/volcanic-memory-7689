class CreateJoinTableScientistExperiment < ActiveRecord::Migration[7.0]
  def change
    create_join_table :scientists, :experiments do |t|
      t.index :scientist_id
      t.index :experiment_id
    end
  end
end
