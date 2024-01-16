# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@lab_1 = Lab.create!(name: "CERN")
@lab_2 = Lab.create!(name: "SLAC")
@scientist_1 = @lab_1.scientsts.create!(name: "Planck", specialty: "Physics", university: "University of Munich")
@scientist_2 = @lab_1.scientsts.create!(name: "Newton", specialty: "Physics", university: "Cambridge")
@scientist_3 = @lab_2.scientsts.create!(name: "Einstein", specialty: "Physics", university: "University of Zurich")
@scientist_4 = @lab_2.scientsts.create!(name: "Bohr", specialty: "Physics", university: "	University of Copenhagen")
@experiment_1 = Experiment.create!(name: "Experiment 1", objective: "Theoretical Physics", num_months: 4)
@experiment_2 = Experiment.create!(name: "Experiment 2", objective: "Theoretical Physics", num_months: 10)
@experiment_3 = Experiment.create!(name: "Experiment 3", objective: "Theoretical Physics", num_months: 15)
@experiment_4 = Experiment.create!(name: "Experiment 4", objective: "Quantum Mechanics", num_months: 12)
@experiment_5 = Experiment.create!(name: "Experiment 5", objective: "Quantum Mechanics", num_months: 24)
@experiment_6 = Experiment.create!(name: "Experiment 6", objective: "Quantum Mechanics", num_months: 48)

@science_experiment_1 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_1)
@science_experiment_2 = ScientistExperiment.create!(scientist: @scientist_2, experiment: @experiment_1)
@science_experiment_3 = ScientistExperiment.create!(scientist: @scientist_3, experiment: @experiment_2)
@science_experiment_4 = ScientistExperiment.create!(scientist: @scientist_4, experiment: @experiment_4)