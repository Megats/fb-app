json.extract! user_chart, :id, :user_name, :created_at, :updated_at
json.url user_chart_url(user_chart, format: :json)
