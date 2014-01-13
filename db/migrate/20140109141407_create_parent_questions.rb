class CreateParentQuestions < ActiveRecord::Migration
  def change
    create_table :parent_questions do |t|

      t.timestamps
    end
  end
end
