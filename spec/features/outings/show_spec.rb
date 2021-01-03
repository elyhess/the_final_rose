require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit an outings show page' do
    before :each do
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
    end

    it 'I can see the details for that outing' do
      visit outing_path(@helicopter_date)

      expect(page).to have_content(@helicopter_date.name)
      expect(page).to have_content("Location: #{@helicopter_date.location}")
      expect(page).to have_content("Date: #{@helicopter_date.date}")

      within("#Contestants") do 
        expect(page).to have_content("Count of contestants: #{@helicopter_date.contestants.count}")
        expect(page).to have_content("Contestants:")
        expect(page).to have_content(@dave.name)
        expect(page).to have_content(@joe.name)
        expect(page).to_not have_content(@jon.name)
      end
    end
  end
end