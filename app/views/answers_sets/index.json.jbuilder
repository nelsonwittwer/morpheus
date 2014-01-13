json.array!(@answers_sets) do |answers_set|
  json.extract! answers_set, :id, :question_id
  json.url answers_set_url(answers_set, format: :json)
end
