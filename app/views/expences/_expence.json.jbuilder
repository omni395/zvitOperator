json.extract! expence, :id, :user_id, :expence, :expence_description, :expence_value, :created_at, :updated_at
json.url expence_url(expence, format: :json)