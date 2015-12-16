json.array!(@currency_converts) do |currency_convert|
  json.extract! currency_convert, :id, :currency
  json.url currency_convert_url(currency_convert, format: :json)
end
