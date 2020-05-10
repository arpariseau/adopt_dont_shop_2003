class Pet < ApplicationRecord
  validates_presence_of :name
  belongs_to :shelter

  def is_adoptable?
    adopt_status == "adoptable"
  end

  def self.number_pets
    count
  end
end
