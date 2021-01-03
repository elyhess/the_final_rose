require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit a bachelorettes show page' do
    before :each do
      @staci = Bachelorette.create!(name: "Staci", description: "Best season ever", season_number: 1)
      @darlene = Bachelorette.create!(name: "Darlene", description: "Worst season ever", season_number: 2)

      @dave = @staci.contestants.create!(name: "Dave", age: 26, hometown: "Denver")
      @joe = @staci.contestants.create!(name: "joe", age: 49, hometown: "Chicago")
    end
    it 'I see the bachelorettes info' do
      visit bachelorette_path(@staci)

      expect(page).to have_content(@staci.name)
      expect(page).to have_content(@staci.description)
      expect(page).to have_content("Season #{@staci.season_number}")
      expect(page).to have_link("Contestants")
    end
  end
end