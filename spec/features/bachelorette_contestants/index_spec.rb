require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit a bachelorette_contestants index page' do
    before :each do
      @staci = Bachelorette.create!(name: "Staci", description: "Best season ever", season_number: 1)
      @darlene = Bachelorette.create!(name: "Darlene", description: "Worst season ever", season_number: 2)

      @dave = @staci.contestants.create!(name: "Dave", age: 26, hometown: "Denver")
      @joe = @staci.contestants.create!(name: "joe", age: 49, hometown: "Chicago")
    end

    it 'I can see all of the contestants for that bachelorette' do
      visit bachelorette_path(@staci)

      click_link "Contestants"

      expect(page).to have_content("Contestants for #{@staci.name}")

      within("#contestant-#{@dave.id}") do 
        expect(page).to have_link(@dave.name)
        expect(page).to have_content("Age: #{@dave.age}")
        expect(page).to have_content("Hometown: #{@dave.hometown}")
      end

      within("#contestant-#{@joe.id}") do 
        expect(page).to have_link(@joe.name)
        expect(page).to have_content("Age: #{@joe.age}")
        expect(page).to have_content("Hometown: #{@joe.hometown}")
      end
    end

    it 'I can click on the contestants name and am taken to their show page' do
      visit bachelorette_contestants_path(@staci)

      click_link @dave.name

      expect(current_path).to eq(contestant_path(@dave))
    end

    it 'I see a list of unique hometowns of all contestants, no repeats' do
      berb = @staci.contestants.create!(name: "berb", age: 12, hometown: "Chicago")

      visit bachelorette_contestants_path(@staci)

      within("#hometowns") do 
        expect(page).to have_content("These contestants are from the following hometowns:")
        expect(page).to have_content(@dave.hometown)
        expect(page).to have_content(@joe.hometown, count: 1)
      end

    end
  end
end