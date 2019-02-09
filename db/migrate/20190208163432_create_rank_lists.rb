class CreateRankLists < ActiveRecord::Migration[5.2]
  def change
    create_table :rank_lists do |t|
      t.integer :student_id
      t.integer :total
      t.timestamps
    end
  end
end
