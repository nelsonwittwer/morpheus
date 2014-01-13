json.array!(@parent_questions) do |parent_question|
  json.extract! parent_question, :id
  json.url parent_question_url(parent_question, format: :json)
end
