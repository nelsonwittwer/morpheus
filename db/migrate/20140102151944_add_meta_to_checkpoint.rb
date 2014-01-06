class AddMetaToCheckpoint < ActiveRecord::Migration
  def change
    add_column :checkpoints, :version, :intger
    add_column :checkpoints, :actor, :intger
  end
end
