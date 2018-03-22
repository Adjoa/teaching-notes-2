class CreateRehearsals < ActiveRecord::Migration[5.1]
  def change
    create_table :rehearsals do |t|
      t.belongs_to :event, foreign_key: true
      t.datetime :time
      t.string :venue

      t.timestamps
    end
  end
end
