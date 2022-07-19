TOTAL_USERS = 100

# create demo users data
if User.count.zero?
  p 'Creating users'

  users = TOTAL_USERS.times.map { |_t| { email: Faker::Internet.email, password: 'password', password_confirmation: 'password' } }
  User.create(users)
end

# create categories
total_categories = 0
if Category.count.zero?
  p 'Creating categories'

  values = TOTAL_CATEGORIES.times.map do
    "('#{Faker::Name.name.gsub(/'/, '')}', '2022/#{(1..12).to_a.sample}/19', '2022/#{(1..12).to_a.sample}/19')"
  end

  sql = 'INSERT INTO categories(description, created_at, updated_at) VALUES '
  ActiveRecord::Base.connection.execute(sql + values.join(', '))

  total_categories = ActiveRecord::Base.connection.execute('SELECT COUNT(*) FROM categories')
  total_categories = total_categories.first[0]
  p "Created #{total_categories} items"
end

# create recipes
total_recipes = 0
if Recipe.count.zero?
  p 'Creating recipes'

  # In my local will change to 100 to create 1_000_000 records for testing
  # Change it to 10 for the seed run quickly
  10.times.each do
    values = 10_000.times.map do |idx|
      "('#{Faker::Name.name.gsub(/'/, '')}', 'descriptions #{idx}', '#{rand(3.minutes.to_i..12.hours.to_i)}', '#{rand(1..3)}', '#{rand(1..TOTAL_USERS)}', '#{rand(1..total_categories)}', '2022/#{(1..12).to_a.sample}/19', '2022/#{(1..12).to_a.sample}/19')"
    end

    sql = 'INSERT INTO recipes(title, descriptions, time, difficulty, user_id, category_id, created_at, updated_at) VALUES '
    ActiveRecord::Base.connection.execute(sql + values.join(', '))

    total_recipes = ActiveRecord::Base.connection.execute('SELECT COUNT(*) FROM recipes')
    total_recipes = total_recipes.first[0]
    p "Created #{total_recipes} items"
  end

  Recipe.reindex
end

# create ingredients demo
total_ingredients = 0
if Ingredient.count.zero?
  p 'Creating ingredients'


  # In my local will change to 100 to create 1_000_000 records for testing
  # Change it to 10 for the seed run quickly
  10.times.each do
    values = 10_000.times.map do |idx|
      "('#{rand(1..3)}', '#{rand(1..100)}', '#{rand(1..total_recipes)}', '2022/#{(1..12).to_a.sample}/19', '2022/#{(1..12).to_a.sample}/19')"
    end

    sql = 'INSERT INTO ingredients(unit, amount, recipe_id, created_at, updated_at) VALUES '
    ActiveRecord::Base.connection.execute(sql + values.join(', '))

    total_ingredients = ActiveRecord::Base.connection.execute('SELECT COUNT(*) FROM ingredients')
    total_ingredients = total_ingredients.first[0]
    p "Created #{total_ingredients} items"
  end
end

# if there is no OAuth application created, create them
p 'Creating app for Doorkeeper'
Doorkeeper::Application.create(name: 'Backend', redirect_uri: '', scopes: '') if Doorkeeper::Application.count.zero?
p Doorkeeper::Application.first
