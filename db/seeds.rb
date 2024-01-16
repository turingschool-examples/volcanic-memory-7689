# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@lab1 = Lab.create(name: "Bletchley Park")
@scientist1 = @lab1.scientists.create(name: "Alan Turing", specialty: "cryptanalysis", university: "University of Cambridge")
@experiment1 = @scientist1.experiments.create!(name: "Ultra", objective: "cracking Enigma", num_months: 7)
@experiment2 = @scientist1.experiments.create!(name: "Imitation Game", objective: "intelligent machinery", num_months: 4)
@experiment3 = @scientist1.experiments.create!(name: "Turing Test", objective: "intelligent machinery", num_months: 8)
@experiment4 = @scientist1.experiments.create!(name: "Chess", objective: "find best chess player at Cambridge", num_months: 5)

@scientist2 = @lab1.scientists.create(name: "Gordon Welchman", specialty: "mathematics", university: "University of Cambridge")
@scientist3 = @lab1.scientists.create(name: "Hugh Alexander", specialty: "mathematics", university: "University of Cambridge")
@scientist4 = @lab1.scientists.create(name: "Stuart Milner-Barry", specialty: "chess", university: "University of Cambridge")

@experiment1.scientists << @scientist2
@experiment1.scientists << @scientist3
@experiment1.scientists << @scientist4

@experiment2.scientists << @scientist2
@experiment2.scientists << @scientist3

