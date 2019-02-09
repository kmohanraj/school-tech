class CreateAssignSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :assign_subjects do |t|
      t.integer :subject_id
      t.integer :user_id

      t.timestamps
    end
  end
end
