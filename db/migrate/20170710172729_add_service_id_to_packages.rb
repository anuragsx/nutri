class AddServiceIdToPackages < ActiveRecord::Migration[5.0]
  def change
  	add_column :packages, :service_id, :integer
  end
end
