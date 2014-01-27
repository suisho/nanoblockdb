json.array!(@products) do |product|
  json.extract! product, :id, :name, :model_name, :amazon_url
  json.url product_url(product, format: :json)
end
