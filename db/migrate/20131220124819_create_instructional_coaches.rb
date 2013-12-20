class CreateInstructionalCoaches < ActiveRecord::Migration
  def change
    create_table :instructional_coaches do |t|

      t.timestamps
    end
  end
end
