class HomeController < ApplicationController

	#layout 'application'

	layout :resolve_layout

	def index
		@services = Service.all
	end	

	def client_dashboard

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
		end	
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
