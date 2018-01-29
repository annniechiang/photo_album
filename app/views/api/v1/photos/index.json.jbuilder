json.data do
  json.array! @photos do |photo|
    json.partial! "photo", object: photo
  end
end