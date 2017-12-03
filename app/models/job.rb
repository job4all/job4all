class Job < ApplicationRecord
  belongs_to :advertise
  belongs_to :profession
  belongs_to :degree
  belongs_to :city
  

  def self.search(keywords)
    products = order(:city_id)
    products = products.where("city_id like ?", "%#{keywords}%") if keywords.present?
    products
  end
end
