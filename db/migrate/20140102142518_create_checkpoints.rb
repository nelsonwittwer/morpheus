class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.integer :student_id
      t.integer :title
      t.integer :actor
      t.integer :version

      t.timestamps
    end

    add_index :checkpoints, :student_id
  end
end
