class CreateAssignMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :assign_marks do |t|
      t.integer :mark
      t.references :subject, foreign_key: true
      t.references :student, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
