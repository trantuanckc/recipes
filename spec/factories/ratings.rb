FactoryBot.define do
  factory :rating do
    rated_by { FactoryBot.create(:user) }
    recipe { FactoryBot.create(:recipe) }
    point { rand(1..5) }
    content { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
    status { 'reviewing' }
  end
end
