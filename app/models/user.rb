class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:timeoutable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :educations, :dependent => :destroy
  has_many :userskills, :dependent => :destroy
  has_many :experiences, :dependent => :destroy
  


  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "40x40>" },
  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



  validates :first_name,presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only letters are allowed" }
  validates :last_name,presence: true , format:{ with: /\A[a-zA-Z]+\z/, message: "Only letters are allowed" }
  #validates :mobile, presence: true, format: { with: /\A(\+\d{1,2})\d{3}\d{7}/, message: "bad format" }
#  validates :mobile,uniqueness: true,format: { with: /\d+\d{5}-\d{7}/, message: "bad format" }

  

	def user_name
		if first_name.present? || last_name.present?
			"#{first_name} #{last_name}" 
		else
			email
		end			
	end

  
end
