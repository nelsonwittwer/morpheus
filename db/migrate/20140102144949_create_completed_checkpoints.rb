class CreateCompletedCheckpoints < ActiveRecord::Migration
  def change
    create_table :completed_checkpoints do |t|
      t.integer :checkpoint_id
      t.integer :student_id

      t.timestamps
    end

    add_index :completed_checkpoints, [:checkpoint_id, :student_id]
  end
end
