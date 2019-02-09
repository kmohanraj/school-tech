class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :sub_name
      t.string :sub_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
