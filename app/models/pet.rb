class Pet < ApplicationRecord
  validates_presence_of :image
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :sex
  validates_presence_of :shelter_name
end
