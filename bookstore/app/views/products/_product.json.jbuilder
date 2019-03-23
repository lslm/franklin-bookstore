json.extract! product, :id, :author, :year, :title, :publisher, :edition, :isbn, :pages, :synopsis, :dimensions, :barcode, :active, :activation_reason, :created_at, :updated_at
json.url product_url(product, format: :json)
