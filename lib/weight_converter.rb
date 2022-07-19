class WeightConverter
  prepend SimpleCommand

  UNITS = {
    'cup' => 128,
    'teaspoons' => 4.928921594,
    'kilogram' => 1000,
    'gram' => 1
  }

  def initialize(options = {})
    @amount = options[:amount].to_f
    @from = options[:from]
    @to = options[:to]
  end

  def call
    return errors.add(:base, :invalid_amount) if @amount.zero?
    return errors.add(:base, :invalid_params) unless ([@from, @to] - UNITS.keys).empty?

    (@amount * UNITS[@from]).to_f / UNITS[@to]
  end
end
