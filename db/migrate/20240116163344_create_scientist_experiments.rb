class CreateScientistExperiments < ActiveRecord::Migration[7.0]
  def change
    create_table :scientist_experiments do |t|
      t.belongs_to :scientist, null: false, foreign_key: true
      t.belongs_to :experiment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
