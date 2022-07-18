if @error_message.present?
  json.error_message @error_message
else
  json.result @result
end
