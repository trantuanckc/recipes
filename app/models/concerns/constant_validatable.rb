module ConstantValidatable
  # rubocop:disable Style/RegexpLiteral
  HIRAGANA_VALIDATION_FORMAT = %r{\A[ぁ-んー－]+\z}
  KATAKANA_VALIDATION_FORMAT = %r{\A[ァ-ヶー－]+\z}
  PHONE_NUMBER_VALIDATION_FORMAT = %r{\A[+]?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}\z}
  # rubocop:enable Style/RegexpLiteral
  URL_VALIDATION_FORMAT = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}
end
