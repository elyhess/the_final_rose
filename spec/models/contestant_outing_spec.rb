require 'rails_helper'

RSpec.describe ContestantOuting, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :}
  end

  describe 'relationships' do
    it {should belong_to :contestant }
    it {should belong_to :outing }
  end

  describe 'instance methods' do
  end

  describe 'class methods' do
  end
end