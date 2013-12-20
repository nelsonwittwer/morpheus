class CreateCompleteds < ActiveRecord::Migration
  def change
    create_table :completeds do |t|

      t.timestamps
    end
  end
end
