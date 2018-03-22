class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :rehearsal, foreign_key: true

      t.timestamps
    end
  end
end
