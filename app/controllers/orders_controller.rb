class OrdersController < ApplicationController
	before_action :authenticate_user!
  layout "client"

  def checkout
  	@services = Service.all
  	@service = Service.find(params[:ser_id])
  	@package = @service.packages.find(params[:pckid])
  end	
end
