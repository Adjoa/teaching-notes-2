class AddGoingAndWentToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :going, :boolean
    add_column :attendances, :went, :boolean
  end
end
