module ServicesHelper

	def method_caption(params)
		params[:action] == 'edit' ? 'Edit Service' : 'New Service'
	end	

end
