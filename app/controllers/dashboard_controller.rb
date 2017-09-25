class DashboardController < ApplicationController
	layout 'client'

	def enroll_service
		@services = Service.all
		if params[:id].present?
			@service = Service.find(params[:id])
			@packages = @service.packages
		end	
	end	

	def users_list
		@new_users = User.new_users
		@new_orders = Order.new_orders
		@users = User.all
	end	

end
