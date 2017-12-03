class Newspaper < ApplicationRecord
	has_many :advertises
	
	



def category_name=(name)
  self.category = Category.find_or_create_by_name(name) if name.present?
end


def newspaper_name
	  newspaper.try(:name)
	end
	
	def newspaper_name=(name)
	  self.newspaper = Newspaper.find_or_create_by_name(name) if name.present?
	end
end
