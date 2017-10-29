class Order < ApplicationRecord
	belongs_to :user

	  def self.new_orders
    	where('created_at >= ?', 1.week.ago).count
  	end

  	def service_name
  		service = Service.find(self.service_id)
  		service.title
  	end 

  	def package_name
  		service = Service.find(self.service_id)
  		package = service.packages.find(self.package_id)
		  package.duration  		
  	end	

    def payment_status
      self.order_status? ? 'Payment Received' : 'Payment Not Received'
    end  
end
