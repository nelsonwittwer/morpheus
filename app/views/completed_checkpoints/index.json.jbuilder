json.array!(@completed_checkpoints) do |completed_checkpoint|
  json.extract! completed_checkpoint, :id, :checkpoint_id, :student_id
  json.url completed_checkpoint_url(completed_checkpoint, format: :json)
end
