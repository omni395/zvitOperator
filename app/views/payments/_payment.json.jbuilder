json.extract! payment, :id, :client_address, :client_name, :client_payment, :client_description, :created_at, :updated_at
json.url payment_url(payment, format: :json)