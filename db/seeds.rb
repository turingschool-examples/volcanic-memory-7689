# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@lab_1 = Lab.create(name: "Spencer Mansion")
@lab_2 = Lab.create(name: "Raccoon City Underground")

@scientist_1 = @lab_1.scientists.create(name: "Albert Wesker", specialty: "Bio-engineering", university: "Oxford")
@scientist_2 = @lab_1.scientists.create(name: "William Birkin", specialty: "Epidemiology", university: "Johns Hopkins")
@scientist_3 = @lab_2.scientists.create(name: "Annette Birkin", specialty: "Virology", university: "Johns Hopkins")

@experiment_1 = @scientist_1.experiments.create(name: "T Virus", objective: "Create a self-propagating, bloodborne virus that transforms the hosts into durable bio-weapons.", num_months: 18)
@experiment_2 = @scientist_2.experiments.create(name: "G Virus", objective: "Create a retrovirus that transforms hosts into bio-weapons with greater combat capability than T Virus hosts.", num_months: 24)
