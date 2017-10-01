class AddOrderDetailsInOrders < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :total_amount, :string
  	add_column :orders, :card_holder_name, :string
  	add_column :orders, :order_number, :string
  end
end
