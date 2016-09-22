json.array!(@sentences) do |sentence|
  json.extract! sentence, :id, :input
  json.url sentence_url(sentence, format: :json)
end
