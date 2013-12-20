class AddKeysToCompletedAssessments < ActiveRecord::Migration
  def change
    add_column :completed_assessments, :student_id, :integer
    add_column :completed_assessments, :assessment_id, :integer
    add_index :completed_assessments, :student_id
    add_index :completed_assessments, :assessment_id
  end
end
