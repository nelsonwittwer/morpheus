class AddCheckpointIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :checkpoint_id, :integer
    add_index :questions, :checkpoint_id
  end
end
