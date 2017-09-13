class AddUserDemographic < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :first_name, :text
  	add_column :users, :last_name, :text
  	add_column :users, :phone_no, :integer
  end
end
