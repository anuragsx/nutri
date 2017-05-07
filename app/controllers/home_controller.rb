class HomeController < ApplicationController

	#layout 'application'

	layout :resolve_layout

	def index

	end	

	def client_dashboard

	end	

	def about

	end

	def nutritionist_online

	end	

	def services

	end	

	def service_details

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
