module ProfilesHelper
	def method_caption_profile(params)
		if params[:action] == 'edit'
		  'Edit Profile'
		elsif params[:action] == 'show'
		  'Profile Details'
		else
		  'Add Profile'
		end
	end	

	def profile_page_path(obj)
		obj.id.present? ? profile_path(obj) : new_profile_path 
	end	
end
