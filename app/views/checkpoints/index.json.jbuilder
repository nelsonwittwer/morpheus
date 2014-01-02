json.array!(@checkpoints) do |checkpoint|
  json.extract! checkpoint, :id, :student_id, :type
  json.url checkpoint_url(checkpoint, format: :json)
end
