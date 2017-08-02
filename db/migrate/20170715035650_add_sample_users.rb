class AddSampleUsers < ActiveRecord::Migration[5.0]
  def change
  	Role.all.each do |role|
    	u = User.new(email: "#{role.name.downcase}" + "@gmail.com", password: 'anurag', 
    					password_confirmation: 'anurag', role_id: role.id)
    	u.save!
    end
  end
end
