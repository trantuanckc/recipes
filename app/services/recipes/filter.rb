module Recipes
  class Filter
    prepend SimpleCommand

    def initialize(params)
      @params = params
    end

    def call
      command = Recipe.search(
        title,
        where: builded_queries,
        includes: [:ingredients, { ratings: :rated_by }],
        page: @params[:page],
        per_page: Pagy::DEFAULT[:items]
      )
      results = command.results

      return errors.add(:filter, :no_result) if results.empty?

      pagy = Pagy.new_from_searchkick(command)

      { pagy: pagy, recipes: results }
    end

    private

    def title
      search_params[:title] || '*'
    end

    def builded_queries
      queries = {}

      queries[:time] = time_range if time_range

      queries[:difficulty] = search_params[:difficulty] if search_params[:difficulty]

      queries
    end

    def time_range
      time_from = search_params.dig(:time, :from).to_i
      time_to = search_params.dig(:time, :to).to_i

      return time_from..time_to if time_from.nonzero? && time_to.nonzero?
      return { gte: time_from } if time_from.nonzero?

      { lte: time_to } if time_to.nonzero?
    end

    def search_params
      @params.require(:q).permit(:title, :difficulty, time: %i[from to])
    end
  end
end
