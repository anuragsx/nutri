class ChangePhoneNoColumnTypeToString < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :phone_no, :string
  	change_column :users, :first_name, :string
  	change_column :users, :last_name, :string
  end
end
