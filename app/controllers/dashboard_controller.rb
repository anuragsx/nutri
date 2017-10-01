class DashboardController < ApplicationController
	before_action :authenticate_user!
	layout 'client'

	def enroll_service
		@services = Service.all
		if params[:id].present?
			@service = Service.find(params[:id])
			@packages = @service.packages
		end	
	end	

end
