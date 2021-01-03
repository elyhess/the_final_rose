require "rails_helper"

RSpec.describe Contestant, type: :model do
  describe "validations" do
    # it { should validate_presence_of :}
  end

  describe "relationships" do
    it { should belong_to :bachelorette }
    it { should have_many :contestant_outings }
    it { should have_many :outings }
  end

  describe "instance methods" do
  end

  describe "class methods" do
    before :each do
      @staci = Bachelorette.create!(name: "Staci", description: "Best season ever", season_number: 1)
      @darlene = Bachelorette.create!(name: "Darlene", description: "Worst season ever", season_number: 2)

      @dave = @staci.contestants.create!(name: "Dave", age: 20, hometown: "Denver")
      @joe = @staci.contestants.create!(name: "joe", age: 28, hometown: "Chicago")
      @jon = @staci.contestants.create!(name: "jon", age: 30, hometown: "Cleveland")

      @helicopter_date = Outing.create!(name: "Helicopter Date", location: "Paris", date: "12/12/2021")
      @pool_party = Outing.create!(name: "Pool Date", location: "France", date: "12/1/2021")

      ContestantOuting.create!(outing: @helicopter_date, contestant: @dave)
      ContestantOuting.create!(outing: @helicopter_date, contestant: @joe)
      ContestantOuting.create!(outing: @pool_party, contestant: @dave)
    end

    it "::average_age" do
      expect(Contestant.average_age).to eq(26)
    end

  end
end
