class Organization < ApplicationRecord
	has_many :advertises
	has_many :experiences
end
