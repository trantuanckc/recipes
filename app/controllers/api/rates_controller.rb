module Api
  class RatesController < Api::BaseController
    before_action :doorkeeper_authorize!
    before_action :current_user_authenticate

    def create
      command = Rates::Create.call(current_user, params)

      return @error_message = command.errors.full_messages unless command.success?

      @rating = command.result
    end
  end
end
