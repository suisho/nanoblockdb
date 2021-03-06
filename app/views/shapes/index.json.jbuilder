json.array!(@shapes) do |shape|
  json.extract! shape, :id, :name, :model_name, :image, :long_side_size, :short_side_size, :long_side_dot_num
  json.url shape_url(shape, format: :json)
end
