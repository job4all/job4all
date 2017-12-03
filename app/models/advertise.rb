class Advertise < ApplicationRecord
  belongs_to :newspaper
  belongs_to :organization
  has_many :jobs, dependent: :destroy

  

  has_attached_file :image, :styles => { :medium => "500x500" }, 
  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
def self.search(term)
  if term
    where('title LIKE ?', "%#{term}%").order('id DESC')
  else
    order('id DESC') 
  end
end

end
