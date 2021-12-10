json.extract! user_datum, :id, :user_id, :user_name, :user_goal, :self_assessment_score, :created_at, :updated_at
json.url user_datum_url(user_datum, format: :json)
json.token user.generate_jwt