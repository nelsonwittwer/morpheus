class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :parent_question_id
      t.integer :answer_type
      t.string :name
      t.integer :posistion
      t.string :english_text
      t.string :spanish_text
      t.integer :checkpoint_id
      t.integer :answers_set_id
      t.string :legacy_question_name

      t.timestamps
    end

    add_index :questions, :parent_question_id
    add_index :questions, :checkpoint_id
    add_index :questions, :answers_set_id
  end
end
