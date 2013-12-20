class CreateCompletedAssessments < ActiveRecord::Migration
  def change
    create_table :completed_assesments do |t|

      t.timestamps
    end
  end
end
