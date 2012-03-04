class CreateRouteAssignments < ActiveRecord::Migration
  def change
    create_table :route_assignments do |t|
      t.float :lat
      t.float :lon
      t.integer :route_number

      t.timestamps
    end
  end
end
