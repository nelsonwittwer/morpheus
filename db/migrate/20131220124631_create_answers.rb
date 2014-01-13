class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :english_text
      t.string :spanish_text
      t.integer :answers_set_id
      t.integer :posistion
      t.integer :legacy_response_value

      t.timestamps
    end

    add_index :answers, :answers_set_id
  end
end
