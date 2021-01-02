require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :}
  end

  describe 'relationships' do
    it {should have_many :contestant_outings}
    it {should have_many :contestants }
  end

  describe 'instance methods' do
  end

  describe 'class methods' do
  end
end