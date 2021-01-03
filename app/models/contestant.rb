class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  def self.average_age
    average(:age)
  end

  def self.unique_hometowns
    distinct.pluck(:hometown)
  end
end
