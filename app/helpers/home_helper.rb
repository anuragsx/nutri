module HomeHelper
	def selected(params, service)
		(params.to_i == service.id) ? 'selected' : ''
	end	
end