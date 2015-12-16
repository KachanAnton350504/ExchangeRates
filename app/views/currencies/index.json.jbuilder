json.array!(@currencies) do |currency|
  json.extract! currency, :id, :currency, :currency_to
  json.url currency_url(currency, format: :json)
end
