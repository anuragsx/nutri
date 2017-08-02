json.extract! profile, :id, :food_allergies, :medical_condition_id, :height, :weight, :date_of_birth, :health_goal, :smoking, :alcohol, :food_preference, :breakfast, :lunch, :dinner, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
