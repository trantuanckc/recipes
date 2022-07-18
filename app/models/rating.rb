class Rating < ApplicationRecord
  belongs_to :rated_by, foreign_key: 'rated_by', class_name: 'User', inverse_of: :ratings

  belongs_to :recipe

  enum status: {
    published: 'published',
    reviewing: 'reviewing',
    rejected: 'rejected'
  }

  validates :point, numericality: { in: 1..5 }

  validates :status, presence: true

  validate :rate_to_own_recipe?, if: -> { recipe && rated_by }

  private

  def rate_to_own_recipe?
    errors.add(:rated_by, I18n.t('errors.cannot_rate_your_own')) if recipe.user_id == rated_by.id
  end
end
