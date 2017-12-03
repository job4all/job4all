class Country < ApplicationRecord
	has_many :cities , :dependent => :destroy
	has_many :states , :dependent => :destroy
end
