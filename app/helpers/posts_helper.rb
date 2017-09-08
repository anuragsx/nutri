module PostsHelper
	def method_caption_posts(params)
		params[:action] == 'edit' ? 'Edit Post' : 'New Post'
	end	
end
