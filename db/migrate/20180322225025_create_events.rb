class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :time
      t.string :venue
      t.belongs_to :teacher, foreign_key: true

      t.timestamps
    end
  end
end
