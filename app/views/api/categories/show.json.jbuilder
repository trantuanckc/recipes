if @error_message.blank?
  json.category do
    json.id @category.id
    json.description @category.description
    json.created_at @category.created_at
    json.updated_at @category.updated_at
  end
else
  json.error_message @error_message
end
