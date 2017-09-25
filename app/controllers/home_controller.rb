class HomeController < ApplicationController

	#layout 'application'

	layout :resolve_layout

	def index
		@services = Service.all
	end	

	def client_dashboard
		@services = Service.all
		@profile = current_user.profile
		#redirect_to enroll_service_path(session[:selected_service]["id"]) if session[:selected_service].present?
		if session[:selected_service].present?
			redirect_to enroll_service_path(session[:selected_service]["id"])
		else
			if current_user.is_dietitian
				redirect_to users_path
			else
				if @profile.present?
					redirect_to profile_path(@profile)
				else
					redirect_to new_profile_path
				end	
			end	

		end	
	end	

	def about

	end

	def nutritionist_online

	end	

	def services
		@services = Service.all
	end	

	def service_details
		if params[:id].present?
			@service = Service.find(params[:id])
			@services =  Service.all
			session[:selected_service] = @service
		end	
	end	

	def blog
		@posts = Post.all
	end	

	def post
		@post = Post.friendly.find(params[:id])
		@title = @post.title
	end		

	def contact

	end	

	private

	  def resolve_layout
	    case action_name
	    when "index"
	      "application"
	    when "client_dashboard"
	      "client"
	    #else
	    #  "application"
	    end
	  end

end
