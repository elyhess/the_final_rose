require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit a contestants show page' do
    before :each do
      @staci = Bachelorette.create!(name: "Staci", description: "Best season ever", season_number: 1)
      @darlene = Bachelorette.create!(name: "Darlene", description: "Worst season ever", season_number: 2)

      @dave = @staci.contestants.create!(name: "Dave", age: 26, hometown: "Denver")
      @joe = @staci.contestants.create!(name: "joe", age: 49, hometown: "Chicago")

      @helicopter_date = Outing.create!(name: "Helicopter Date", location: "Paris", date: "12/12/2021")
      @pool_party = Outing.create!(name: "Pool Date", location: "France", date: "12/1/2021")

      ContestantOuting.create!(outing: @helicopter_date, contestant: @dave)
      ContestantOuting.create!(outing: @pool_party, contestant: @dave)
    end

    it 'I can see all of the contestants for that bachelorette' do
      visit contestant_path(@dave)

      expect(page).to have_content(@dave.name)
      expect(page).to have_content("Age: #{@dave.age}")
      expect(page).to have_content("Hometown: #{@dave.hometown}")
    end

    it 'I see the season details and list of outings for this contestant' do
      visit contestant_path(@dave)

      expect(page).to have_content("Season #{@dave.bachelorette.season_number}")
      expect(page).to have_content(@dave.bachelorette.description)
      expect(page).to have_content("Outings:")
      expect(page).to have_link(@helicopter_date.name)
      expect(page).to have_link(@pool_party.name)
    end
  end
end