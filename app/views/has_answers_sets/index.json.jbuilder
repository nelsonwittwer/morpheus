json.array!(@has_answers_sets) do |has_answers_set|
  json.extract! has_answers_set, :id, :answers_set_id, :question_id
  json.url has_answers_set_url(has_answers_set, format: :json)
end
