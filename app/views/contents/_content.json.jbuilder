json.extract! content, :id, :titolo, :descrizione, :price, :created_at, :updated_at
json.url content_url(content, format: :json)
