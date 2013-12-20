class AddAssessmentIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :assessment_id, :integer
    add_index :questions, :assessment_id
  end
end
