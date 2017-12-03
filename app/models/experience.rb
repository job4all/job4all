class Experience < ApplicationRecord
  belongs_to :profession
  belongs_to :city
  belongs_to :organization
  belongs_to :user
	
	validates :start_date,presence: true

    validate :start_date_after_end_date?

def start_date_after_end_date?
  if start_date > end_date
    errors.add :end_date, "must be Grater then Start Date"
  end
end


end
