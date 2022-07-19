if @categories.present?
  json.pagination @pagy
  json.categories @categories do |category|
    json.id category.id
    json.created_at category.created_at
    json.updated_at category.updated_at
    json.description category.description
  end
else
  json.error_message @error_message
end
