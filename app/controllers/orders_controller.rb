class OrdersController < ApplicationController
	before_action :authenticate_user!
  layout "client"

  def index

  end	

  def checkout
  	@services = Service.all
  	@service = Service.find(params[:ser_id])
  	@package = @service.packages.find(params[:pckid])
  	session[:cart] ||= {}
  	session[:cart][:ser_id] ||= @service.id
  	session[:cart][:pckid] ||= @package.id
  end	

	def payu_return
		@services = Service.all
		@service = Service.find(session[:cart]["ser_id"])
  	@package = @service.packages.find(session[:cart]["pckid"])
		notification = PayuIndia::Notification.new(request.query_string, options = {:key => 'YOUR_KEY', :salt => 'YOUR_SALT', :params => params})

		if notification.present?      
		  begin
		    if notification.params["status"]         
		      @order = Order.create(:total_amount => notification.params["amount"], 
		      											:card_holder_name => params['name_on_card'], 
		      											:order_number => notification.params["txnid"],
		      											:user_id => current_user.id,
		      											:order_status => true)
		      #flash[:success] = "Thanks to availing the service. Your diet chart will be uploaded soon."
		      #redirect_to checkout_orders_path(ser_id: @service.id, pckid: @package.id)
		    else     
		      @order = Order.create(:total_amount => notification.params["amount"], 
		      											:card_holder_name => notification.params['name_on_card'], 
		      											:order_number => notification.params["txnid"],
		      											:user_id => current_user.id,
		      											:order_status => false)		         
		      render :text => "Order Failed! #{notification.message}"
		    end
		  ensure
		    #@cart.save
		  end
		end    
	end

end
