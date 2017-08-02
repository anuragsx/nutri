class AddHeathGoalData < ActiveRecord::Migration[5.0]
  def change
  	['Weight Loss', 'Weight Gain', 'Weight Maintenance', 'Be Fit & Healthy', 'Manage Diabetes',
  	'Manage Hypertension', 'Reduce Cholestrol Level'].each do |goal|
  		HealthGoal.create(goal_name: goal)
  	end
  end
end
