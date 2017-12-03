class Degree < ApplicationRecord
  belongs_to :tdegree
  has_many :educations
  has_many :jobs
end
