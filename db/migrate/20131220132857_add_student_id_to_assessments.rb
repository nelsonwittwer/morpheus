class AddStudentIdToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :student_id, :integer
    add_index :assessments, :student_id
  end
end
