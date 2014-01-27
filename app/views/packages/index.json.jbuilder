json.array!(@packages) do |package|
  json.extract! package, :id, :product_id, :user_id, :purchased_at
  json.url package_url(package, format: :json)
end
