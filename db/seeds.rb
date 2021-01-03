# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@staci = Bachelorette.create!(name: "Staci", description: "Best season ever", season_number: 1)
@darlene = Bachelorette.create!(name: "Darlene", description: "Worst season ever", season_number: 2)

@dave = @staci.contestants.create!(name: "Dave", age: 26, hometown: "Denver")
@joe = @staci.contestants.create!(name: "joe", age: 49, hometown: "Chicago")
@jon = @staci.contestants.create!(name: "jon", age: 22, hometown: "Cleveland")

@helicopter_date = Outing.create!(name: "Helicopter Date", location: "Paris", date: "12/12/2021")
@pool_party = Outing.create!(name: "Pool Date", location: "France", date: "12/1/2021")

ContestantOuting.create!(outing: @helicopter_date, contestant: @dave)
ContestantOuting.create!(outing: @helicopter_date, contestant: @joe)
ContestantOuting.create!(outing: @pool_party, contestant: @dave)