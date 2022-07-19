if @ratings.present?
  json.pagination @pagy
  json.ratings @ratings
else
  json.ratings []
end
