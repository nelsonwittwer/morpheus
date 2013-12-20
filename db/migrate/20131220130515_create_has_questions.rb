class CreateHasQuestions < ActiveRecord::Migration
  def change
    create_table :has_questions do |t|

      t.timestamps
    end
  end
end
