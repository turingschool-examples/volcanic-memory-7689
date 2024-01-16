# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@lab_1 = Lab.create!(name: "Fermilab")
@lab_2 = Lab.create!(name: "Time-X")

@scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab_id: @lab_1.id)
@scientist_2 = Scientist.create!(name: "George", specialty: "time-travel", university: "MIT", lab_id: @lab_2.id)

@experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
@experiment_2 = Experiment.create!(name: "Time Pod", objective: "create a time traveling machine", num_months: 1)


@scientist_experiments_1 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id)
@scientist_experiments_2 = ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_2.id)
