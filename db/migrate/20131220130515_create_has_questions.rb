class CreateHasQuestions < ActiveRecord::Migration
  def change
    create_table :has_questions do |t|
      t.integer :question_id
      t.integer :checkpoint_id

      t.timestamps
    end

    add_index :has_questions, [:question_id, :checkpoint_id]
  end
end
