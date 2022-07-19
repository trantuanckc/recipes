if @ingredients.present?
  json.pagination @pagy
  json.ingredients @ingredients do |ingredient|
    json.id ingredient.id
    json.created_at ingredient.created_at
    json.updated_at ingredient.updated_at
    json.unit ingredient.unit
    json.unit ingredient.unit
    json.amount ingredient.amount
    json.recipe_id ingredient.recipe_id
  end
else
  json.error_message @error_message
end
