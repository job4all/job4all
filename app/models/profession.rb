class Profession < ApplicationRecord
	has_many :experiences
	has_many :jobs
end
