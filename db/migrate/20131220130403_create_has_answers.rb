class CreateHasAnswers < ActiveRecord::Migration
  def change
    create_table :has_answers do |t|

      t.timestamps
    end
  end
end
