json.array! @movies do |movie|
  json.extract! movie, :id,:title,:rating
end
