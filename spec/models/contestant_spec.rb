require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :}
  end

  describe 'relationships' do
    it {should belong_to :bachelorette }
    it {should have_many :contestant_outings }
    it {should have_many :outings }
  end

  describe 'instance methods' do
  end

  describe 'class methods' do
  end
end
