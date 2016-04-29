json.array!(@answers) do |answer|
  json.extract! answer, :id, :content, :filled, :question_id
  json.url answer_url(answer, format: :json)
end
