class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.belongs_to :teacher, foreign_key: true
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
