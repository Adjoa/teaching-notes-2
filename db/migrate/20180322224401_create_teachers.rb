class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :password_digest
      t.string :name
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
