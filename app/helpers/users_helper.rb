module UsersHelper

	def avatar(user)
		image_tag(user.avatar.url(:thumb), size: "20x20")
	end

	def avatar2(user)
		image_tag(user.avatar.url(:medium), size: "170x170", alt: user.first_name)
	end
	
	def avatar3(user)
		image_tag(user.avatar.url(:medium), size: "165x165", alt: user.first_name)
	end

end
