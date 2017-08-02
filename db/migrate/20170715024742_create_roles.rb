class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
    	t.string :name	
      t.timestamps
    end

    ['Admin', 'Dietitian', 'Client'].each do |role|
    	Role.create(name: role)
    end	
  end
end