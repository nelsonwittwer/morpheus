class CreateHasAnswers < ActiveRecord::Migration
  def change
    create_table :has_answers do |t|
      t.integer :answers_set_id
      t.integer :answer_id

      t.timestamps
    end

    add_index :has_answers, [:answer_id, :answers_set_id]
  end
end
