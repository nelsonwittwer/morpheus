class AddMetaAttributesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_type, :intger
    add_column :questions, :name, :string
    add_column :questions, :posistion, :integer
    add_column :questions, :language, :integer
  end
end
