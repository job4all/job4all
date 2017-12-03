class City < ApplicationRecord
  belongs_to :state
  belongs_to :country
  has_many :educations
  has_many :experiences
  has_many :institutes
  has_many :jobs
  has_many :users
end
