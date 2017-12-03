module ApplicationHelper

	def logged_in_admin?
		current_user && User.find_by(email: "job4allteam@gmail.com") == current_user
	end
	
	def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
         "alert-info"
    end
  end
	
end
