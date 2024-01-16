class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    #add_foreign_key :labs, :scientists, column: :scientist_id
    #add_foreign_key :scientists, :experiments, column: :experiment_id
    #add_foreign_key :experiments, :scientists, column: :scientist_id
  end
end
