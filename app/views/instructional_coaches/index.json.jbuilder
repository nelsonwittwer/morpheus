json.array!(@instructional_coaches) do |instructional_coach|
  json.extract! instructional_coach, :id
  json.url instructional_coach_url(instructional_coach, format: :json)
end
