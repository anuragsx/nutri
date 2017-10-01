class UsersController < ApplicationController
	before_action :authenticate_user!
	layout 'client'

	def index
		@new_users = User.new_users
		@new_orders = Order.new_orders
		@users = User.all
	end	

end
