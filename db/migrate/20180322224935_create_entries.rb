class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.belongs_to :student, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
