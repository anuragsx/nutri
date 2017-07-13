module PackagesHelper
	def method_caption_package(params)
		params[:action] == 'edit' ? 'Edit Package' : 'Create Package'
	end	
end
