class Order < ApplicationRecord
	belongs_to :user

	def self.new_orders
    where('created_at >= ?', 1.week.ago).count
  end 
end
