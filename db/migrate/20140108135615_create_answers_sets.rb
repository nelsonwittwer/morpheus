class CreateAnswersSets < ActiveRecord::Migration
  def change
    create_table :answers_sets do |t|
      t.integer :question_id
      t.timestamps
    end

    add_index :answers_sets, :question_id
  end
end
