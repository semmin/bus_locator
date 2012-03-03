class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :route_id
      t.text :comment
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
