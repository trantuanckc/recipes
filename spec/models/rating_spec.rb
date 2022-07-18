require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) do
    create(:rating)
  end

  describe 'Assocations' do
    it { is_expected.to belong_to(:recipe) }
    it { is_expected.to belong_to(:rated_by) }
  end

  describe 'Valid subject' do
    it 'is valid rating' do
      expect(rating).to be_valid
    end
  end

  describe 'Invalid enum validations' do
    it 'is invalid enum value' do
      rating = described_class.new
      expect do
        rating.status = 'invalid_enum'
      end.to raise_error(ArgumentError, "'invalid_enum' is not a valid status")
    end
  end

  describe 'Validate presence' do
    it { is_expected.to validate_numericality_of(:point) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe 'Validate rate_to_own_recipe?' do
    let(:recipe) { create(:recipe) }

    before do
      rating.recipe = recipe
      rating.rated_by = recipe.user
    end

    it 'is invalid' do
      expect(rating).not_to be_valid
    end
  end
end
