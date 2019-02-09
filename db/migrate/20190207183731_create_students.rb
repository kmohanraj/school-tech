class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :student_name
      t.string :student_code
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
