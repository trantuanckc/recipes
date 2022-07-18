if @rating.present?
  json.content @rating.content
  json.point @rating.point
  json.status @rating.status
  json.created_at @rating.created_at
  json.updated_at @rating.updated_at
  json.rated_by @rating.rated_by
  json.recipe @rating.recipe
else
  json.error_message @error_message
end
