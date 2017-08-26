module PostsHelper
	def method_caption(params)
		params[:action] == 'edit' ? 'Edit Post' : 'New Post'
	end	
end
