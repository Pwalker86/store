json.extract! product, :id, :name, :price, :description, :out_of_stock, :created_at, :updated_at
json.url product_url(product, format: :json)
