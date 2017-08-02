json.extract! health_goal, :id, :goal_name, :goal_desc, :created_at, :updated_at
json.url health_goal_url(health_goal, format: :json)
