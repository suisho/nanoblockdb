json.array!(@package_contents) do |package_content|
  json.extract! package_content, :id, :package_id, :color_id, :shape_id, :count
  json.url package_content_url(package_content, format: :json)
end
