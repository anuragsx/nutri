module OrdersHelper

	def transaction_id
		order = Order.last
		if order.present?
			order.id + 1
		else
			1
		end	
	end	

end
