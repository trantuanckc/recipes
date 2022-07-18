module Rates
  class Create
    prepend SimpleCommand

    def initialize(user, params)
      @rated_by = user
      @rating_params = rating_params(params)
    end

    def call
      rating = Rating.new(
        rated_by: @rated_by,
        recipe: recipe,
        content: @rating_params[:content],
        point: @rating_params[:point],
        status: Rating.statuses[:reviewing]
      )

      return errors.add(:base, rating.errors.messages) unless rating.save

      rating
    end

    private

    def rating_params(params)
      params.required('rates').permit(:recipe_id, :content, :point)
    end

    def recipe
      @recipe ||= Recipe.find(@rating_params[:recipe_id])
    end
  end
end
