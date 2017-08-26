class AddColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :user_id, :integer
  	add_column :orders, :order_status, :integer
  	add_column :orders, :payment_status, :integer
  end
end
