class CreateCompletedAssessments < ActiveRecord::Migration
  def change
    create_table :completed_assessments do |t|

      t.timestamps
    end
  end
end
