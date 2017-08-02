module HomeHelper
	def selected(params, service)
		(params.to_i == service.id) ? 'selected' : ''
	end	

	def redirect_location
		current_user.present? ? dashboard_path : new_user_session_path
	end	
end