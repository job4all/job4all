class Institute < ApplicationRecord
  belongs_to :city
  has_many :educations
end
