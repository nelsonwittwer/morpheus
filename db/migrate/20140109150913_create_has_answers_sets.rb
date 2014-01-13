class CreateHasAnswersSets < ActiveRecord::Migration
  def change
    create_table :has_answers_sets do |t|
      t.integer :answers_set_id
      t.integer :question_id

      t.timestamps
    end

    add_index :has_answers_sets, [:answers_set_id, :question_id]
  end
end
