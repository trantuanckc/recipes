module Api
  class ConvertsController < Api::BaseController
    def index
      command = WeightConverter.call(
        amount: convert_params[:amount],
        from: convert_params[:from],
        to: convert_params[:to]
      )

      return @error_message = command.errors.full_messages.to_sentence unless command.success?

      @result = command.result
    end

    private

    def convert_params
      params.require(:convert).permit(:amount, :from, :to)
    end
  end
end
