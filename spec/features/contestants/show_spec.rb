require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit a contestants show page' do
    before :each do
      @staci = Bachelorette.create!(name: "Staci", description: "Best season ever", season_number: 1)
      @darlene = Bachelorette.create!(name: "Darlene", description: "Worst season ever", season_number: 2)

      @dave = @staci.contestants.create!(name: "Dave", age: 26, hometown: "Denver")
      @joe = @staci.contestants.create!(name: "joe", age: 49, hometown: "Chicago")
    end

    it 'I can see all of the contestants for that bachelorette' do
      visit contestant_path(@dave)

      expect(page).to have_content(@dave.name)
      expect(page).to have_content("Age: #{@dave.age}")
      expect(page).to have_content("Hometown: #{@dave.hometown}")
    end
  end
end