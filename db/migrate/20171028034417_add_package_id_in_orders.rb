class AddPackageIdInOrders < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :package_id, :integer
  end
end
