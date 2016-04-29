json.array!(@responses) do |response|
  json.extract! response, :id, :name, :data, :survey_id
  json.url response_url(response, format: :json)
end
