class DashboardController < ApplicationController
	layout 'client'

	def enroll_service
		@services = Service.all
		if params[:id].present?
			@service = Service.find(params[:id])
			@packages = @service.packages
		end	
	end	
end
