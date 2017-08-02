class CreateHealthGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :health_goals do |t|
      t.string :goal_name
      t.text :goal_desc

      t.timestamps
    end
  end		
end