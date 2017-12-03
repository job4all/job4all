class Education < ApplicationRecord
  belongs_to :tdegree
  belongs_to :degree
  belongs_to :city
  belongs_to :institute
  belongs_to :user

  validates :tmarks, :numericality => { :greater_than_or_equal_to => 0 }
  validates :omarks, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => :tmarks }
  
  before_save proc { self.persent = ((omarks  * 100) / tmarks)} 
end