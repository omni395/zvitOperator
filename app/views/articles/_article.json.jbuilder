json.extract! article, :id, :title, :article_description, :article, :user_id, :created_at, :updated_at
json.url article_url(article, format: :json)